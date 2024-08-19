import 'package:e_ticaret_mobil_uygulama/state_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CartButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    int cartItemCount = Provider.of<CartState>(context).counter;
    return Stack(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
          ),
          onPressed: onPressed,
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        if (cartItemCount != 0)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                '$cartItemCount',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
