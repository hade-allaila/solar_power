import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar_app/models/home_response_model.dart';
import 'package:solar_app/models/load_model.dart';
import 'package:solar_app/networking/api_client.dart';
import 'package:solar_app/networking/api_response.dart';
import 'package:solar_app/repos/delete_load.dart';
import 'package:solar_app/repos/force_load_repo.dart';
import 'package:solar_app/repos/home_repo.dart';
import 'package:solar_app/theming/app_text_styles.dart';
import 'package:solar_app/utils/avaliable_loadpins_database_helper.dart';
import 'package:solar_app/utils/load_database_helper.dart';
import 'package:solar_app/utils/print_debug.dart';

class HomeProvider extends ChangeNotifier {
  HomeResponseModel? data;
  Timer? _timer;
  ApiResult result = ApiResult.inital;
  String ipAddress = '';
  TextEditingController ipController = TextEditingController();
  Future<void> getHomePage() async {
    try {
      HomeRepo repo = HomeRepo();
      var res = await repo.getHomePage();
      if (res is Success) {
        data = HomeResponseModel.fromJson(res.data);
        // print(data);
        await LoadDatabaseHelper.instance.syncReomteLoads(data!.devices);
        await syncLocalLoadsToRemote(data!.devices);
        result = ApiResult.success;
        notifyListeners();
        setTimer();
      } else if (res is Failer) {
        var response = await HomeRepo().getHomePage();
        if (response is Failer) {
          result = ApiResult.failer;
          var pref = await SharedPreferences.getInstance();
          ipAddress = pref.getString('ipaddress') ?? "";
          ipController.text = ipAddress;
          if (_timer != null) {
            // print("timer canceled");
            _timer!.cancel();
          }
          notifyListeners();
          return;
        }
      }
    } catch (e) {
      printDebug(e.toString());
    }
  }

  void setTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      result = ApiResult.inital;
      try {
        HomeRepo repo = HomeRepo();
        var res = await repo.getHomePage();
        if (res is Success) {
          data = HomeResponseModel.fromJson(res.data);
          await syncLocalLoadsToRemote(data!.devices);
          await LoadDatabaseHelper.instance.syncReomteLoads(data!.devices);
          result = ApiResult.success;
          notifyListeners();
        } else if (res is Failer) {
          var response = await HomeRepo().getHomePage();
          if (response is Failer) {
            result = ApiResult.failer;
            var pref = await SharedPreferences.getInstance();
            ipAddress = pref.getString('ipaddress') ?? "";
            ipController.text = ipAddress;
            if (_timer != null) {
              // print("timer canceled");
              timer.cancel();
            }
            notifyListeners();
            return;
          }
        }
      } catch (e) {
        printDebug(e.toString());
      }
    });
  }

  void handleIpChange() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('ipaddress', ipController.text);
    ApiClient.instance.configureDio(ipController.text);
    if (_timer != null) {
      _timer!.cancel();
    }
    getHomePage();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  Future<void> syncLocalLoadsToRemote(List<LoadModel> loads) async {
    List<LoadModel> loadsToSync = await LoadDatabaseHelper.instance.diffLoads(
      loads,
    );
    // print(
    //   "+++++++++++++++++++++++++++ loads to be synced ++++++++++++++++++++++++++++",
    // );
    // print(loadsToSync);
    data!.devices.addAll(loadsToSync);
    var homeRepo = HomeRepo();
    if (loadsToSync.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      loadsToSync.forEach((e) async {
        await homeRepo.addLoad(e);
      });
    }
    return;
  }

  void handelDeleteLoad(
    String deviceName,
    BuildContext context,
    int pin,
  ) async {
    await  AvaliableLoadpinsDatabaseHelper.instance.togglePinState(pin, 1);
    var device = data!.devices
        .where((e) => e.deviceName == deviceName)
        .toList()[0];
    data!.devices.remove(device);
    // print("device " + device.deviceName + "has removed");
    var repo = DeleteLoadRepo();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(top: 5.h, right: 0, left: 0, bottom: 0),
        content: Container(
          height: 30.h,
          color: Colors.redAccent,
          child: Text(
            "تم حذف الحمل بنجاح",
            style: AppTextStyles.font16WhiteBold,
          ),
        ),
      ),
    );
    notifyListeners();
    await repo.deleteLoad(deviceName);
    await LoadDatabaseHelper.instance.deleteLoad(deviceName);
  }

  void handleLoadTap(LoadModel load) async {
    var repo = ForceLoadRepo();
    int value = 0;
    if (load.loadState == LoadState.auto) {
      print('----------------- state by Me --------------------------');
      print(load.loadState);
      value = 1;
    } else if (load.loadState == LoadState.forcedOff) {
      value = 2;
    } else {
      value = 0;
    }
    await repo.forceload(load.deviceName, value);
    // print((res as Success).data);
    notifyListeners();
  }
}

enum ApiResult { inital, success, failer }
