import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitapi/app/modules/user/controller/user_controller.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    Future.delayed(Duration.zero, () async {
      controller.getUser();
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('User'),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.results.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.results[index]['name']),
              );
            },
          ),
        ));
  }
}
