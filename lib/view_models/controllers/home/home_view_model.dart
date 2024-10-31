import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/data/response/status.dart';
import 'package:mvc_or_mvvm_pattern/models/home/user_list_model.dart';
import 'package:mvc_or_mvvm_pattern/repository/home/home_repository.dart';

class HomeViewModelController extends GetxController {
  final HomeRepository _api = HomeRepository();

  final rxRequestStatus = Status.loading.obs;
  final userList = UserListModel().obs;

  void setRxRequestStatus(value) => rxRequestStatus.value = value;

  void setUserList(UserListModel value) => userList.value = value;

  void userListApi() {
    _api.userListApi().then(
      (value) {
        setRxRequestStatus(Status.completed);
        setUserList(value);

      },
    ).onError(
      (error, stackTrace) {
        if (kDebugMode) {
          print(error);
          print(stackTrace);
        }
        setRxRequestStatus(Status.error);
      },
    );
  }
}
