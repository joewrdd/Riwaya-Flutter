import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:riwaya/views/app/controllers/menu_controller.dart';
import 'package:riwaya/views/app/screens/menu/widgets/header_options.dart';
import 'package:riwaya/views/app/screens/menu/widgets/menu_appbar.dart';
import 'package:riwaya/views/app/screens/menu/widgets/menu_items.dart';

class MenuPage extends GetView<RiwayaMenuController> {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MenuAppbar(),
      body: Column(
        children: [
          const HeaderOptions(),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.5),
              decoration: const BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: const MenuItems(),
            ),
          ),
        ],
      ),
    );
  }
}
