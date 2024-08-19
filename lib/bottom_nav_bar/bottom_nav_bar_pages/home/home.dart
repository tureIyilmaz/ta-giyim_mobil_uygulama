import 'package:flutter/material.dart';

import 'app_bar/home_app_bar.dart';
import 'widgets/carousel/carousel.dart';
import 'widgets/catogory/food_category.dart';
import 'widgets/food_cards/data.dart';
import 'widgets/food_cards/food_card.dart';

class HomePage extends StatefulWidget {
  final Function(bool) onToggleTheme;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int notificationNumber = 19;
  String selectedCategory = "Kıyafet";

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<FoodModel> filteredFoodData = foodData
        .where((foodItem) => foodItem.categoryName == selectedCategory)
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: HomeAppBar(
          notificationCount: notificationNumber,
          onToggleTheme: widget.onToggleTheme,
          isDarkMode: widget.isDarkMode,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ImageCarousel(),
            FoodCategory(onCategorySelected: _onCategorySelected),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFoodData.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                    foodItem: filteredFoodData[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
