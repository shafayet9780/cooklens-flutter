import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'category_card.dart';
import 'category_shimmer.dart';
import '../../models/category_item.dart';

class CategoryList extends StatelessWidget {
  final bool isLoading;
  
  const CategoryList({
    super.key,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6, // Show 6 shimmer items
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: const CategoryCardShimmer()
                .animate()
                .fadeIn(delay: Duration(milliseconds: 50 * index)),
            );
          },
        ),
      );
    }

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _demoCategories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryCard(
            category: _demoCategories[index],
            onTap: () {
              // TODO: Navigate to category
            },
          ).animate()
            .fadeIn(delay: Duration(milliseconds: 100 * index))
            .slideX(begin: 0.2, delay: Duration(milliseconds: 100 * index));
        },
      ),
    );
  }
}

final _demoCategories = [
  const CategoryItem(
    id: '1',
    name: 'Italian',
    imageUrl: 'https://picsum.photos/200',
    recipeCount: 45,
  ),
  const CategoryItem(
    id: '2',
    name: 'Japanese',
    imageUrl: 'https://picsum.photos/201',
    recipeCount: 32,
  ),
  const CategoryItem(
    id: '3',
    name: 'Mexican',
    imageUrl: 'https://picsum.photos/202',
    recipeCount: 28,
  ),
  const CategoryItem(
    id: '4',
    name: 'Indian',
    imageUrl: 'https://picsum.photos/203',
    recipeCount: 52,
  ),
];