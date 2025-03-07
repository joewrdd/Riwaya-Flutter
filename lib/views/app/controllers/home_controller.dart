import 'package:get/get.dart';
import '../../../ui/product_model.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  late PageController pageController;
  final RxInt currentCategory = 0.obs;
  final RxInt currentProduct = 0.obs;
  final RxDouble pageOffset = 0.0.obs;
  final RxInt forceRebuild = 0.obs;

  final double viewPortFraction = 0.5;

  final RxList<Product> products = <Product>[].obs;

  List<Product> get dataProducts => products;

  @override
  void onInit() {
    super.onInit();
    _initPageController();
    _updateProducts(); // Initialize products list
  }

  void _initPageController() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: viewPortFraction,
    )..addListener(() {
        updatePageOffset(pageController.page ?? 0.0);
      });
  }

  void _updateProducts() {
    products.value = List<Product>.from(
      allProducts.where(
        (element) => element.category == categories[currentCategory.value],
      ),
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void updatePageOffset(double offset) {
    pageOffset.value = offset;
  }

  void setCurrentProduct(int value) {
    currentProduct.value = value % products.length;
  }

  void setCurrentCategory(int index) {
    if (currentCategory.value != index) {
      currentCategory.value = index;
      currentProduct.value = 0;
      pageController.dispose();
      _initPageController();
      pageOffset.value = 0.0;
      _updateProducts(); // Update products when category changes
    }
  }
}
