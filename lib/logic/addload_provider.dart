import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solar_app/models/load_model.dart';
import 'package:solar_app/repos/add_load_repo.dart';
import 'package:solar_app/utils/avaliable_loadpins_database_helper.dart';
import 'package:solar_app/utils/navigation_extention.dart';
import 'package:solar_app/widgets/dialogs/loading_dialog.dart';
import 'package:solar_app/widgets/dialogs/success_dialog.dart';

class AddloadProvider extends ChangeNotifier {
  bool isAdded = false;
  bool isLoading = false;
  TextEditingController loadName = TextEditingController();
  TextEditingController loadPriority = TextEditingController();
  int loadPin = 0;
  List<Map<String, Object?>> avaliableLoadPins = [];
  TextEditingController loadPower = TextEditingController();
  String minOnTime = "";
  String maxOnTime = "";
  String minOffTime = "";
  String maxOffTime = "";
  String image = "";
  final formKey = GlobalKey<FormState>();

  void handleAddLoad(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await AvaliableLoadpinsDatabaseHelper.instance.togglePinState(loadPin, 0);
      showLoadingDialog(context);
      LoadModel load = LoadModel(
        image: image,
        pin: loadPin,
        deviceName: loadName.text,
        operationPower: int.parse(loadPower.text),
        minOnTime: minOnTime,
        maxOnTime: maxOnTime,
        minOffTime: minOffTime,
        state: "OFF",
        maxOffTime: maxOffTime,
        priority: int.parse(loadPriority.text),
        loadState: LoadState.auto,
      );

      // print("========================= add Load ===========================");
      // print(load.toJson());
      AddLoadRepo repo = AddLoadRepo();
      repo.addLoadToLocal(load);
      int result = await repo.addLoad(load);
      if (result == 201) {
        context.pop();
        showSuccessDialog(context);
      }
    }
  }
  void getPinLoadNumber() async { 
    var loadpins = await AvaliableLoadpinsDatabaseHelper.instance.getAvaliablePins();
    avaliableLoadPins = loadpins;
    notifyListeners();
  }
}
