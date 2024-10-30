import '../../data/network/network_api_services.dart';
import '../../res/app_urls/app_urls.dart';

class RegisterRepository{
  final NetworkApiServices _apiService = NetworkApiServices();
  Future<dynamic> registerApi(data)async{
    dynamic response = await _apiService.postApi(data, AppUrls.registerUrl);
    return response;
  }

}