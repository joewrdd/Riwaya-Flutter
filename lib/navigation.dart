import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:riwaya/views/app/screens/home.dart';
import 'package:riwaya/views/app/screens/menu.dart';
import 'package:riwaya/views/app/screens/subscription.dart';

// Move NavigationController to top-level
class NavigationController extends GetxController {
  final Rx<int> currentIndex = 0.obs;

  final List<Widget> screens = [
    const HomePage(),
    const MenuPage(),
    const SubscriptionPage(),
  ];
}

class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({super.key});

  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          height: 65,
          items: [
            const Icon(Icons.home),
            SvgPicture.asset(
              'assets/coffee-bean.svg',
              height: myHeight * 0.021,
              color: Colors.black,
            ),
            const Icon(Icons.star),
          ],
          backgroundColor:
              controller.currentIndex.value == 2 ? Colors.white : secondColor,
          index: controller.currentIndex.value,
          color: forthColor.withOpacity(0.6),
          animationDuration: const Duration(milliseconds: 300),
          letIndexChange: (value) => true,
          onTap: (value) => controller.currentIndex.value = value,
        ),
      ),
    );
  }
}
