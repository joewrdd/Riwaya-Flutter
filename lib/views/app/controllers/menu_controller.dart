import 'package:get/get.dart';
import 'package:riwaya/ui/product_model.dart';

class RiwayaMenuController extends GetxController {
  final RxInt selectedCategory = 0.obs;
  final RxList<Product> filteredProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    filterProducts();
  }

  void setCategory(int index) {
    selectedCategory.value = index;
    filterProducts();
  }

  void filterProducts() {
    filteredProducts.value = products
        .where(
            (product) => product.category == categories[selectedCategory.value])
        .toList();
  }
}
