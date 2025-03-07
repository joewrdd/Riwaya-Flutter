import 'package:flutter/material.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:riwaya/ui/product_model.dart';

class ProductHeader extends StatelessWidget {
  final Product product;
  final VoidCallback onInfoTap;

  const ProductHeader({
    super.key,
    required this.product,
    required this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.35,
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              IconButton(
                onPressed: onInfoTap,
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.brown.shade300,
                  size: 24,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: firstColor,
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'Best Sales',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 12,
              ),
            )
          ],
        ),
      ],
    );
  }
}
