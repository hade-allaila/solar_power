import 'package:dio/dio.dart';
import 'package:solar_app/utils/print_debug.dart';

class ApiClient {
  static final ApiClient instance = ApiClient._init();
  ApiClient._init();
  Dio dio = Dio();
  Future<Response> getHomePage() async {
    Response response;
    response = await dio.get("/home");
    printDebug(response.data.toString());
    return response;
  }

  Future<Response> addLoad(Map<String, dynamic> load) async {
    Response response;
    response = await dio.post('/addload', data: load);
    return response;
  }

  Future<Response> deleteLoad(String loadName) async {
    Response response;
    response = await dio.delete("/deleteload", data: {'deviceName': loadName});
    return response;
  }

  Future<Response> forceLoadState(String loadName, int value) async {
    Response response;
    response = await dio.post(
      '/forceload',
      data: {"deviceName": loadName, "forceState": value},
    );
    return response;
  }

  void configureDio(String? ipAddress) {
    if (ipAddress != null) {
      dio.options.baseUrl = "http://$ipAddress";
    } else {
      dio.options.baseUrl = "http://solar-manager.local";
    }
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.receiveTimeout = Duration(seconds: 10);
  }
}
