import 'package:mvc_or_mvvm_pattern/data/network/network_api_services.dart';
import 'package:mvc_or_mvvm_pattern/res/app_urls/app_urls.dart';

class LoginRepository{
  final NetworkApiServices _apiService = NetworkApiServices();

  Future<dynamic> loginApi(data)async{
    dynamic response = await _apiService.postApi(data, AppUrls.loginUrl);
    return response;
  }
}