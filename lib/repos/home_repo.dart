import 'package:dio/dio.dart';
import 'package:solar_app/models/load_model.dart';
import 'package:solar_app/networking/api_client.dart';
import 'package:solar_app/networking/api_response.dart';

class HomeRepo {
  Future<ApiResponse> getHomePage() async {
    try { 
    ApiClient client = ApiClient.instance;
    Response response = await client.getHomePage();
    return Success(data: response.data);
    }
    catch(e) { 
      return Failer(msg: e.toString());
    }
  
  }

    Future<int> addLoad(LoadModel load) async {
    ApiClient api = ApiClient.instance;
    var response = await api.addLoad(load.toJson());
    return response.statusCode!;
  }
}
