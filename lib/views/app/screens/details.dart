import 'package:flutter/material.dart';
import 'package:riwaya/common/background.dart';
import 'package:riwaya/common/product_image.dart';
import 'package:riwaya/common/size_option_item.dart';
import 'package:riwaya/utils/widgets/add_to_cart_button.dart';
import 'package:riwaya/utils/widgets/product_header.dart';
import 'package:riwaya/utils/widgets/quantity_selector.dart';
import 'package:riwaya/utils/widgets/product_info_dialog.dart';
import 'package:riwaya/views/app/controllers/details_controller.dart';
import 'package:riwaya/ui/product_model.dart';
import 'package:riwaya/ui/size_options_model.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:riwaya/views/app/controllers/cart_controller.dart';
import 'package:riwaya/views/app/screens/cart.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailsController());
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Obx(() => Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.brown.shade400,
                    ),
                    if (cartController.items.isNotEmpty)
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
                            cartController.items.length.toString(),
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
          const SizedBox(width: 15),
        ],
      ),
      body: Stack(children: [
        const Background(),
        Positioned(
          left: 20,
          right: 20,
          child: Column(
            children: [
              Hero(
                tag: product.name,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.81,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ProductImage(product: product),
                ),
              ),
              const SizedBox(height: 10),
              ProductHeader(
                product: product,
                onInfoTap: () => _showInfoDialog(context),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!product.category.name.toLowerCase().contains('food'))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Size Options',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sizeOptions.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () =>
                                        controller.setSelectedSize(index),
                                    child: SizeOptionItem(
                                      size: sizeOptions[index],
                                      isSelected:
                                          controller.selectedSize.value ==
                                              index,
                                      index: index,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  QuantitySelector(
                    onDecrement: controller.decrementQuantity,
                    onIncrement: controller.incrementQuantity,
                    quantity: controller.quantity,
                  ),
                  const SizedBox(width: 30),
                  AddToCartButton(
                    onTap: () {
                      cartController.addToCart(
                        product,
                        controller.quantity.value,
                        size: !product.category.name
                                .toLowerCase()
                                .contains('food')
                            ? sizeOptions[controller.selectedSize.value].name
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ProductInfoDialog(product: product),
    );
  }
}
