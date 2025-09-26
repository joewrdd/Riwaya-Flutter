import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:riwaya/views/app/controllers/cart_controller.dart';
import 'package:riwaya/views/app/screens/cart.dart';

class MenuAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/coffee-cup.png",
            height: 30,
            color: Colors.brown.shade400,
          ),
          const SizedBox(width: 5),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Riwaya.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '.رواية',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Obx(() => Stack(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.brown.shade400,
                    size: 27,
                  ),
                  if (Get.find<CartController>().items.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: firstColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          Get.find<CartController>().items.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              )),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
