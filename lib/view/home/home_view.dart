import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/data/response/status.dart';
import 'package:mvc_or_mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvc_or_mvvm_pattern/view/home/widgets/card_widget.dart';
import 'package:mvc_or_mvvm_pattern/view/test/test.dart';

import '../../view_models/controllers/home/home_view_model.dart';
import '../../view_models/controllers/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserPreference _userPreference = UserPreference();
  final HomeViewModelController _homeController =
      Get.put(HomeViewModelController());

  @override
  void initState() {
    super.initState();
    _homeController.userListApi();
  }

  @override
  void dispose() {
    Get.delete<HomeViewModelController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              _userPreference.clearUser().then(
                (value) {
                  Get.offAllNamed(RoutesName.loginView);
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(
        () {
          switch (_homeController.rxRequestStatus.value) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.error:
              return Text('something_wrong'.tr);
            case Status.completed:
              return ListView.builder(
                itemCount: _homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    index: index,
                  );
                },
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const FadedButton());
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
