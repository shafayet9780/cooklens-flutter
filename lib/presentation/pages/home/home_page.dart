import 'package:flutter/material.dart';
import 'package:cooklens/core/theme/colors.dart';

// Widgets
import 'widgets/featured_recipe_card.dart';
import 'widgets/category_list/category_list.dart';
import 'widgets/recipe_grid/recipe_grid.dart';
import '../../widgets/common/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CookLens'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const FeaturedRecipeCard(),
                const SectionTitle(title: 'Categories'),
                const SizedBox(height: 12),
                const CategoryList(),
                const SectionTitle(title: 'Popular Recipes'),
                const SizedBox(height: 12),
              ]),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: RecipeGrid(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement AR camera
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }
}
