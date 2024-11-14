import 'package:flutter/material.dart';
import '../../../../../presentation/widgets/common/shimmer_container.dart';

class RecipeCardShimmer extends StatelessWidget {
  const RecipeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          ShimmerContainer(
            height: 150,
            borderRadius: 0,
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title placeholder
                ShimmerContainer(
                  width: 120,
                  height: 20,
                ),
                SizedBox(height: 8),
                // Info row placeholder
                Row(
                  children: [
                    ShimmerContainer(
                      width: 60,
                      height: 16,
                    ),
                    SizedBox(width: 12),
                    ShimmerContainer(
                      width: 40,
                      height: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}