import 'package:flutter/material.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:get/get.dart';

class QuantitySelector extends StatelessWidget {
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final RxInt quantity;

  const QuantitySelector({
    super.key,
    required this.onDecrement,
    required this.onIncrement,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: secondColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.remove,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Obx(() => Text(
              quantity.value.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: secondColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
