import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state_data.dart';
import 'payment.dart';

class RouteCart extends StatelessWidget {
  const RouteCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
      ),
      body: Consumer<CartState>(
        builder: (context, stateData, child) {
          double totalPrice = 0;

          // Toplam fiyatı hesapla
          for (var cartItem in stateData.cartItems) {
            if (cartItem.foodItem.discount) {
              totalPrice += (cartItem.foodItem.price * 0.9) * cartItem.quantity;
            } else {
              totalPrice += cartItem.foodItem.price * cartItem.quantity;
            }
          }

          return stateData.cartItems.isEmpty
              ? const Center(
                  child: Text(
                    "Sepetiniz boş",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: stateData.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = stateData.cartItems[index];
                          (cartItem.foodItem.price * 0.9)
                              .toInt(); // %10 indirim

                          return Dismissible(
                            key: Key(cartItem.foodItem.name),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onDismissed: (direction) {
                              stateData.removeFromCart(cartItem.foodItem);
                            },
                            child: ListTile(
                              leading: SizedBox(
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(360),
                                  child: cartItem.foodItem.image,
                                ),
                              ),
                              title: Text(cartItem.foodItem.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (cartItem.foodItem.discount) ...[
                                    Text(
                                      'Fiyat: ${(cartItem.foodItem.price * cartItem.quantity).toStringAsFixed(2)} TL',
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Text(
                                      'İndirimli Fiyat: ${(cartItem.foodItem.price * cartItem.quantity * 0.9).toStringAsFixed(2)} TL',
                                    ),
                                  ] else ...[
                                    Text(
                                      'Fiyat: ${(cartItem.foodItem.price * cartItem.quantity).toStringAsFixed(2)} TL',
                                    ),
                                  ]
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle),
                                    onPressed: () {
                                      stateData
                                          .decreaseFromCart(cartItem.foodItem);
                                    },
                                  ),
                                  Text('${cartItem.quantity}'),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle),
                                    onPressed: () {
                                      stateData.addToCart(cartItem.foodItem);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Toplam: ${totalPrice.toStringAsFixed(2)} TL',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentScreen(totalPrice: totalPrice),
                                ),
                              );
                            },
                            child: const Text(
                              'Ödemeye Git',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
