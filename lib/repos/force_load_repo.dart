import 'package:dio/dio.dart';
import 'package:solar_app/networking/api_client.dart';
import 'package:solar_app/networking/api_response.dart';

class ForceLoadRepo {
  Future<ApiResponse> forceload(String loadName, int value) async {
    try {
      ApiClient api = ApiClient.instance;
      Response res = await api.forceLoadState(loadName, value);
      return Success(data: res.data);
    } catch (e) {
      return Failer(msg: e.toString());
    }
  }
}
