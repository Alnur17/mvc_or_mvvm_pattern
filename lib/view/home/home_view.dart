import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/routes/routes_name.dart';

import '../../view_models/controllers/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserPreference _userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _userPreference.clearUser().then(
            (value) {
              Get.toNamed(RoutesName.loginView);
            },
          );
        },
        child: const Text('LogOut'),
      ),
    );
  }
}
