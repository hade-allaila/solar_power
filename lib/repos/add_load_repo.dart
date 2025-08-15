import 'package:solar_app/models/load_model.dart';
import 'package:solar_app/networking/api_client.dart';
import 'package:solar_app/utils/load_database_helper.dart';

class AddLoadRepo {
  Future<int> addLoad(LoadModel load) async {
    ApiClient api = ApiClient.instance;
    var response = await api.addLoad(load.toJson());
    return response.statusCode!;
  }

  Future<void> addLoadToLocal(LoadModel load) async {
    LoadDatabaseHelper.instance.addLoad(load);
  }
}
