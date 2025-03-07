import 'package:get/get.dart';
import 'package:riwaya/ui/product_model.dart';
import 'package:flutter/material.dart';

class CartItem {
  final Product product;
  final int quantity;
  final String? size;

  CartItem({
    required this.product,
    required this.quantity,
    this.size,
  });

  double get total => product.price * quantity;
}

class CartController extends GetxController {
  final RxList<CartItem> items = <CartItem>[].obs;

  double get total => items.fold(0, (sum, item) => sum + item.total);

  void addToCart(Product product, int quantity, {String? size}) {
    if (quantity <= 0) {
      Get.snackbar(
        'Invalid Quantity',
        'Please select at least 1 item',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
        margin: const EdgeInsets.all(10),
        borderRadius: 10,
        duration: const Duration(seconds: 2),
        icon: const Icon(Icons.error_outline, color: Colors.red),
      );
      return;
    }

    final existingItem = items.firstWhereOrNull(
        (item) => item.product.name == product.name && item.size == size);

    if (existingItem != null) {
      final index = items.indexOf(existingItem);
      items[index] = CartItem(
        product: product,
        quantity: existingItem.quantity + quantity,
        size: size,
      );
    } else {
      items.add(CartItem(
        product: product,
        quantity: quantity,
        size: size,
      ));
    }
    Get.snackbar(
      '🎉 Added to Cart',
      '${quantity}x ${product.name} ${size != null ? "($size)" : ""} added to your cart',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade100,
      colorText: Colors.green.shade900,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.check_circle_outline, color: Colors.green),
    );
  }

  void removeFromCart(CartItem item) {
    items.remove(item);
  }

  void updateQuantity(CartItem item, int quantity) {
    final index = items.indexOf(item);
    if (quantity > 0) {
      items[index] = CartItem(
        product: item.product,
        quantity: quantity,
        size: item.size,
      );
    } else {
      removeFromCart(item);
    }
  }

  void clearCart() {
    items.clear();
  }
}
