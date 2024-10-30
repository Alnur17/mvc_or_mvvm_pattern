import 'package:mvc_or_mvvm_pattern/data/network/network_api_services.dart';
import 'package:mvc_or_mvvm_pattern/models/home/user_list_model.dart';
import 'package:mvc_or_mvvm_pattern/res/app_urls/app_urls.dart';

class HomeRepository{
  final NetworkApiServices _apiService = NetworkApiServices();

  Future<UserListModel> userListApi()async{
    dynamic response = await _apiService.getApi(AppUrls.userListUrl);
    return UserListModel.fromJson(response);
  }
}