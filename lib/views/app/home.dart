import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riwaya/common/background.dart';
import 'package:riwaya/common/category_item.dart';
import 'package:riwaya/common/product_image.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:riwaya/views/app/screens/details.dart';
import 'package:riwaya/views/app/screens/notifications.dart';
import 'package:riwaya/views/app/screens/settings.dart';
import '../../ui/product_model.dart';
import 'package:get/get.dart';
import 'package:riwaya/views/app/controllers/home_controller.dart';
import 'package:riwaya/utils/custom/clip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Riwaya.',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Center(
            child: Stack(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const SettingsScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        size: 28,
                        Icons.settings,
                        color: Colors.brown.shade400,
                      ),
                    ),
                    SizedBox(
                      width: myWidth * 0.045,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const NotificationsPage(),
                          ),
                        );
                      },
                      child: Icon(
                        size: 27,
                        Icons.message_outlined,
                        color: Colors.brown.shade400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: myWidth * 0.04)
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          Positioned(
            top: 5,
            left: 30,
            child: Text(
              "There's Always A \nStory To Tell.",
              style: GoogleFonts.cairo(
                  color: Colors.black,
                  height: 1.2,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Positioned(
            top: 75,
            left: 0,
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                color: firstColor,
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Obx(() => Container(
                          height: 190,
                          width: 110,
                          color: controller.currentCategory.value == index
                              ? const Color(0xFFD2B48C)
                              : Colors.transparent,
                        )),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                color: firstColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(categories.length, (index) {
                    double padding = index == 0
                        ? 0
                        : index == 1
                            ? 75
                            : index == 2
                                ? 65
                                : index == 3
                                    ? 0
                                    : 0;

                    return GestureDetector(
                      onTap: () => controller.setCurrentCategory(index),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: padding,
                        ),
                        child: CategoryItem(
                          category: categories[index],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.56,
                width: MediaQuery.of(context).size.width,
                color: secondColor,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: CustomClip(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Obx(() {
                      final products = controller.dataProducts;
                      return PageView.builder(
                        controller: controller.pageController,
                        onPageChanged: controller.setCurrentProduct,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final items = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(product: items),
                                ),
                              );
                            },
                            child: Hero(
                              tag: items.name,
                              child: Obx(
                                () {
                                  double scale = max(
                                      controller.viewPortFraction,
                                      (1 -
                                              (controller.pageOffset.value -
                                                      index)
                                                  .abs()) +
                                          controller.viewPortFraction * 0.3);

                                  return Transform.translate(
                                    offset: Offset(0, -50 * scale),
                                    child: ProductImage(product: items),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: GetX<HomeController>(
                    builder: (controller) {
                      final currentProduct = controller
                          .dataProducts[controller.currentProduct.value];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            currentProduct.name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '\$${currentProduct.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              controller.dataProducts.length,
                              (index) => indicator(index, controller),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer indicator(int index, HomeController controller) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 3,
            color: index == controller.currentProduct.value
                ? const Color(0xFFD2B48C)
                : Colors.transparent),
      ),
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: index == controller.currentProduct.value
              ? Colors.white
              : Colors.white60,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
