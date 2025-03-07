import 'package:flutter/material.dart';
import 'package:riwaya/utils/constants/colors.dart';
import 'package:riwaya/ui/product_model.dart';
import 'package:riwaya/utils/widgets/custom_info_row.dart';

class ProductInfoDialog extends StatelessWidget {
  final Product product;

  const ProductInfoDialog({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: firstColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.coffee,
                    color: firstColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(height: 24),
            CustomInfoRow(
              icon: Icons.local_fire_department_outlined,
              label: 'Calories',
              value: '${product.calories} cal',
            ),
            if (product.milkType != null)
              CustomInfoRow(
                icon: Icons.water_drop_outlined,
                label: 'Milk Type',
                value: product.milkType!,
              ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ingredients',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: product.ingredients.map((ingredient) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: firstColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    ingredient,
                    style: const TextStyle(
                      color: firstColor,
                      fontSize: 12,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
