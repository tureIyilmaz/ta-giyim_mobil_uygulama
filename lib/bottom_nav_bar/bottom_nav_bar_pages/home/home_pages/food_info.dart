import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../state_data.dart';
import '../widgets/food_cards/data.dart';

class FoodInfo extends StatefulWidget {
  final FoodModel foodItem;

  const FoodInfo({super.key, required this.foodItem});

  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
  @override
  Widget build(BuildContext context) {
    FavoriteState favoriteState = Provider.of<FavoriteState>(context);
    bool isFavorite = favoriteState.isFavorite(widget.foodItem);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodItem.name),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GestureDetector(
                onTap: () {
                  favoriteState.toggleFavorite(widget.foodItem);
                },
                child: Image(
                  image: widget.foodItem.image.image,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 16,
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<CartState>(context, listen: false)
                        .addToCart(widget.foodItem);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: const Size(32, 32),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  onPressed: () {
                    favoriteState.toggleFavorite(widget.foodItem);
                  },
                  icon: isFavorite
                      ? const Icon(Icons.favorite, color: Colors.red, size: 32)
                      : const Icon(Icons.favorite_border,
                          color: Colors.white, size: 32),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Malzemeler: ${widget.foodItem.rating}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.foodItem.discount) ...[
                    Text(
                      'Fiyat: ${widget.foodItem.price.toStringAsFixed(2)} TL',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${(widget.foodItem.price * 0.9).toStringAsFixed(0)} TL',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.red,
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Fiyat: ${widget.foodItem.price.toStringAsFixed(2)} TL',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
