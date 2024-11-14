import 'package:flutter/material.dart';
import '../../../../../presentation/widgets/common/shimmer_container.dart';

class CategoryCardShimmer extends StatelessWidget {
  const CategoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: const Column(
        children: [
          // Image placeholder
          ShimmerContainer(
            height: 70,
            borderRadius: 0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Title placeholder
                ShimmerContainer(
                  width: 60,
                  height: 16,
                ),
                SizedBox(height: 4),
                // Count placeholder
                ShimmerContainer(
                  width: 40,
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}