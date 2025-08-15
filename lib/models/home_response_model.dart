import 'package:solar_app/models/load_model.dart';

class HomeResponseModel {
  final double batterPercent;
  final int solarPower;
  final int housePower;
  final bool isGridOn;
  final int gridPowerDraw;
  final List<LoadModel> devices;
  HomeResponseModel({
    required this.batterPercent,
    required this.solarPower,
    required this.housePower,
    required this.isGridOn,
    required this.gridPowerDraw,
    required this.devices,
  });
  factory HomeResponseModel.fromJson(Map<String, dynamic> jsonData) {
    List<LoadModel> devices = [];
    jsonData['devices'].forEach((e) async {
      devices.add(LoadModel.fromJson(e));
    });
    return HomeResponseModel(
      batterPercent: jsonData['battery_percent'] * 1.0,
      solarPower: jsonData['solar_power'],
      housePower: jsonData['house_power'],
      isGridOn: jsonData['is_grid_on'],
      gridPowerDraw: jsonData['grid_power_draw'],
      devices: devices,
    );
  }
}
