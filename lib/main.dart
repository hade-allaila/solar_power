import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar_app/networking/api_client.dart';
import 'package:solar_app/solar_power_app.dart';
import 'package:solar_app/utils/avaliable_loadpins_database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  var prefs = await SharedPreferences.getInstance();
  String? ipAddress = prefs.getString('ipaddress');
  ApiClient.instance.configureDio(ipAddress);
  var lang = prefs.getString("lang");
  runApp(SolarPowerApp(lange: lang));
}
