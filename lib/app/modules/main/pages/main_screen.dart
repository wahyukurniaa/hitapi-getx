import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitapi/app/modules/articles/page/articel_screen.dart';
import 'package:hitapi/app/modules/counter/page/counter_screen.dart';
import 'package:hitapi/app/modules/main/controller/main_controller.dart';
import 'package:hitapi/app/modules/user/page/user_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              UserScreen(),
              CounterScreen(),
              ArticleSCreen(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: Colors.red,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            currentIndex: controller.selectedIndex.value,
            onTap: controller.setSelectedIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'User',
                icon: Icon(
                  Icons.person,
                  size: 24.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Counter',
                icon: Icon(
                  Icons.abc,
                  size: 24.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Article',
                icon: Icon(
                  Icons.assignment,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ));
  }
}
