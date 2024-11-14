import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FeaturedRecipeCard extends StatelessWidget {
  const FeaturedRecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'featured_recipe',
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/400/200'),
              fit: BoxFit.cover,
            ),
          ),
          child: InkWell(
            onTap: () {
              // Navigate to recipe detail
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Italian Pasta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ).animate().fadeIn().slideX(),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      _RecipeInfo(
                        icon: Icons.timer,
                        label: '30 min',
                      ),
                      SizedBox(width: 16),
                      _RecipeInfo(
                        icon: Icons.star,
                        label: '4.5',
                        iconColor: Colors.amber,
                      ),
                    ],
                  ).animate().fadeIn().slideX(delay: 200.ms),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RecipeInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;

  const _RecipeInfo({
    required this.icon,
    required this.label,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 16),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}