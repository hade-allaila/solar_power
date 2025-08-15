abstract class ApiResponse { 

}
class Success extends ApiResponse { 
  final Map<String, dynamic> data;
  Success({required this.data});
}
class Failer extends ApiResponse { 
  final String msg;
  Failer({required this.msg});
}