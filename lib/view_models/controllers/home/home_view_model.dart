import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/data/response/status.dart';
import 'package:mvc_or_mvvm_pattern/models/home/user_list_model.dart';
import 'package:mvc_or_mvvm_pattern/repository/home/home_repository.dart';

class HomeViewModel extends GetxController{
  final HomeRepository _api = HomeRepository();

  final rxRequestStatus = Status.loading.obs;
  final userList = UserListModel().obs;

  void userListApi(){
    _api.userListApi().then((value) {

    },).onError((error, stackTrace) {

    },);
  }
}