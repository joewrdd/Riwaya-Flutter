import 'package:flutter/material.dart';
import 'package:riwaya/utils/constants/colors.dart';
import '../ui/size_options_model.dart';

class SizeOptionItem extends StatelessWidget {
  final SizeOption size;
  final bool isSelected;
  final int index;

  const SizeOptionItem({
    super.key,
    required this.size,
    required this.isSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: isSelected ? secondColor : firstColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              'assets/coffee-cup.png',
              color: isSelected ? Colors.white : firstColor,
              width: 25 + (index * 5),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          size.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        Text(
          '${size.quantity} Fl Oz',
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
