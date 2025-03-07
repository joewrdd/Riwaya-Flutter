import 'package:flutter/material.dart';
import 'package:riwaya/utils/constants/colors.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String duration;
  final List<String> features;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionPlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.duration,
    required this.features,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? firstColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? firstColor : Colors.grey.shade200,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$',
                  style: TextStyle(
                    color: isSelected ? Colors.white70 : Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/$duration',
                  style: TextStyle(
                    color: isSelected ? Colors.white70 : Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: isSelected ? Colors.white70 : firstColor,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        feature,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white70
                              : Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
