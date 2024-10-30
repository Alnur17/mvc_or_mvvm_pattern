import 'package:mvc_or_mvvm_pattern/data/network/network_api_services.dart';
import 'package:mvc_or_mvvm_pattern/res/app_urls/app_urls.dart';

class Repository{
  final NetworkApiServices _apiService = NetworkApiServices();

  Future<dynamic> loginApi(data)async{
    dynamic response = _apiService.postApi(data, AppUrls.loginUrl);
    return response;
  }

  Future<dynamic> registerApi(data)async{
    dynamic response = _apiService.postApi(data, AppUrls.registerUrl);
    return response;
  }

}