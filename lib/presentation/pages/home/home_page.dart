import 'package:flutter/material.dart';
import 'package:cooklens/core/theme/colors.dart';

// Widgets
import 'widgets/featured_recipe_card.dart';
import 'widgets/category_list/category_list.dart';
import 'widgets/recipe_grid/recipe_grid.dart';
import '../../widgets/common/section_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: RecipeGrid(isLoading: _isLoading),
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
