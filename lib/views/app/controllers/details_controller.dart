import 'package:get/get.dart';

class DetailsController extends GetxController {
  final RxInt selectedSize = 0.obs;
  final RxInt quantity = 1.obs;

  void setSelectedSize(int index) {
    selectedSize.value = index;
  }

  void incrementQuantity() {
    quantity.value++;
    update();
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      update();
    }
  }

  @override
  void onClose() {
    quantity.value = 1;
    super.onClose();
  }
}
