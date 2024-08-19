import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state_data.dart';

class PaymentScreen extends StatelessWidget {
  final double totalPrice;

  const PaymentScreen({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ödeme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Toplam Tutar: ${totalPrice.toStringAsFixed(2)} TL',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<CartState>(context, listen: false).clearCart();
              },
              child: const Text('Ödemeyi Tamamla'),
            ),
          ],
        ),
      ),
    );
  }
}
