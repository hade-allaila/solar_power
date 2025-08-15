import 'package:solar_app/networking/api_client.dart';
import 'package:solar_app/networking/api_response.dart';

class DeleteLoadRepo {
  Future<ApiResponse> deleteLoad(String loadName) async{ 
    try { 
    ApiClient api = ApiClient.instance;
    var res = await api.deleteLoad(loadName);
    return Success(data: res.data);
    }
    catch(e) { 
      return Failer(msg: e.toString());
    }
  }
}