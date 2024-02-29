import 'package:agromate/Screens/CartScreen.dart';
import 'package:agromate/Screens/Homescreen.dart';
import 'package:agromate/Screens/Profilescreen.dart';
import 'package:agromate/Screens/communityscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0.0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "home"),
              NavigationDestination(
                  icon: Icon(Icons.group), label: "Community"),
              NavigationDestination(
                  icon: Icon(Icons.shopping_bag), label: "Cart"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile")
            ]),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [HomeScreen(), Community(), Cartscreen(), ProfileScreen()];
}
