import 'package:flutter/material.dart';
import 'package:riwaya/utils/constants/colors.dart';

import '../ui/product_model.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  const ProductImage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return SizedBox(
          height: 140,
          width: constrain.maxWidth,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: constrain.maxWidth,
                height: constrain.maxWidth * 0.9,
                decoration: const BoxDecoration(
                  color: secondColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF3E5AB),
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(constrain.maxWidth * 0.45)),
                child: SizedBox(
                  width: constrain.maxWidth * 0.9,
                  height: constrain.maxWidth * 2.5,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Positioned(
                        bottom: -60,
                        width: constrain.maxWidth * 0.9,
                        height: constrain.maxWidth * 1.5,
                        child: Image.asset(
                          'assets/${product.image}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
