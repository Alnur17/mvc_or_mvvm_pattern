import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controllers/home/home_view_model.dart';

class CardWidget extends StatelessWidget {
  final int index;

  CardWidget({super.key, required this.index});

  final HomeViewModelController _homeController =
      Get.put(HomeViewModelController());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            _homeController.userList.value.data![index].avatar.toString(),
          ),
        ),
        title: Text(
          _homeController.userList.value.data![index].firstName.toString(),
        ),
        subtitle: Text(
          _homeController.userList.value.data![index].email.toString(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info),
        ),
      ),
    );
  }
}
