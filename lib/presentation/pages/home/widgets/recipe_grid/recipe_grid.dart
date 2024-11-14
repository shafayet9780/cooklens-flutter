import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'recipe_card.dart';
import '../../models/recipe_preview.dart';

class RecipeGrid extends StatelessWidget {
  const RecipeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        return RecipeCard(
          recipe: _demoRecipes[index % _demoRecipes.length],
          onTap: () {
            // TODO: Navigate to recipe detail
          },
        ).animate().fadeIn(
          delay: Duration(milliseconds: 100 * index),
        ).slideY(
          begin: 0.2,
          delay: Duration(milliseconds: 100 * index),
        );
      },
    );
  }
}

final _demoRecipes = [
  const RecipePreview(
    id: '1',
    title: 'Spaghetti Carbonara',
    imageUrl: 'https://picsum.photos/400/300',
    cookTime: '25 min',
    rating: 4.8,
    difficulty: 'Medium',
  ),
  const RecipePreview(
    id: '2',
    title: 'Margherita Pizza',
    imageUrl: 'https://picsum.photos/401/300',
    cookTime: '35 min',
    rating: 4.5,
    difficulty: 'Easy',
  ),
  const RecipePreview(
    id: '3',
    title: 'Chicken Tikka',
    imageUrl: 'https://picsum.photos/402/300',
    cookTime: '45 min',
    rating: 4.7,
    difficulty: 'Hard',
  ),
  const RecipePreview(
    id: '4',
    title: 'Caesar Salad',
    imageUrl: 'https://picsum.photos/403/300',
    cookTime: '15 min',
    rating: 4.3,
    difficulty: 'Easy',
  ),
];