import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:riwaya/views/app/controllers/menu_controller.dart';
import 'package:riwaya/ui/product_model.dart';

class HeaderOptions extends StatelessWidget {
  const HeaderOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RiwayaMenuController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menu',
            style: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () => controller.setCategory(index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: controller.selectedCategory.value == index
                            ? firstColor
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          categories[index].name,
                          style: TextStyle(
                            color: controller.selectedCategory.value == index
                                ? Colors.white
                                : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
