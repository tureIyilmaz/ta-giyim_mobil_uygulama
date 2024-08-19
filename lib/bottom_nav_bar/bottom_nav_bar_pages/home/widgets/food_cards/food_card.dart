import 'package:e_ticaret_mobil_uygulama/bottom_nav_bar/bottom_nav_bar_pages/home/home_pages/food_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../state_data.dart';
import 'data.dart';

// ignore: must_be_immutable
class FoodCard extends StatefulWidget {
  final FoodModel foodItem;

  const FoodCard({
    super.key,
    required this.foodItem,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    FavoriteState favoriteState = Provider.of<FavoriteState>(context);
    CompareState compareState = Provider.of<CompareState>(context);

    int discountedPrice = (widget.foodItem.price * 0.9).toInt();
    bool isFavorite = favoriteState.isFavorite(widget.foodItem);
    bool isComparing = compareState.compareItems.contains(widget.foodItem);

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 25, 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Colors.grey[50],
        child: ListTile(
          minVerticalPadding: 20,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodInfo(foodItem: widget.foodItem),
                ),
              );
            },
            child: SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: widget.foodItem.image,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  'Puanı: ${widget.foodItem.rating}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {
                  favoriteState.toggleFavorite(widget.foodItem);
                },
                icon: isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  compareState.toggleCompare(widget.foodItem);
                },
                icon: isComparing
                    ? const Icon(
                        Icons.compare_arrows,
                        color: Colors.blue,
                      )
                    : const Icon(
                        Icons.compare_arrows_outlined,
                      ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.foodItem.name,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (widget.foodItem.discount) ...[
                      Text(
                        'Fiyat: ${widget.foodItem.price.toStringAsFixed(0)} TL',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${discountedPrice.toStringAsFixed(0)} TL',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Fiyat: ${widget.foodItem.price.toStringAsFixed(2)} TL',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              Provider.of<CartState>(context, listen: false)
                  .addToCart(widget.foodItem);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: const Size(36, 36),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
