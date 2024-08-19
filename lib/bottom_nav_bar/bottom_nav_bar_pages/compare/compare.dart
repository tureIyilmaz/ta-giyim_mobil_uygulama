import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state_data.dart';

class Compare extends StatefulWidget {
  const Compare({super.key});

  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  @override
  Widget build(BuildContext context) {
    final compareState = Provider.of<CompareState>(context);

    if (compareState.compareItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Karşılaştır'),
        ),
        body: const Center(
          child: Text('Karşılaştıracak ürün yok.'),
        ),
      );
    }

    // Determine the cheapest and highest-rated items
    final compareItems = compareState.compareItems.toList();
    compareItems.sort((a, b) {
      if (a.price != b.price) {
        return a.price.compareTo(b.price);
      } else {
        return b.rating.compareTo(a.rating);
      }
    });

    final cheapestItem = compareItems.first;
    final highestRatedItem =
        compareItems.reduce((a, b) => a.rating > b.rating ? a : b);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Karşılaştır'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: () {
              compareState.clearCompareList();
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // Adjust as needed
        ),
        itemCount: compareState.compareItems.length,
        itemBuilder: (context, index) {
          final foodItem = compareState.compareItems.elementAt(index);

          // Determine text color based on item properties
          final isCheapest = foodItem == cheapestItem;
          final isHighestRated = foodItem == highestRatedItem;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: foodItem.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    foodItem.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '${foodItem.price.toStringAsFixed(2)} TL',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCheapest ? Colors.green : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Rating: ${foodItem.rating.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isHighestRated ? Colors.green : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
