import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class ProductDetailPage extends ConsumerWidget {
  final String productName;
  final double pricePerKg;
  final String imageUrl;

  ProductDetailPage({
    required this.productName,
    required this.pricePerKg,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController weightController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(imageUrl, height: 200, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('₺$pricePerKg / kg', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Ağırlık Gir (gram cinsinden):'),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Örn: 500 gram'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final weightText = weightController.text.trim();
                if (weightText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lütfen ağırlık giriniz.')),
                  );
                  return;
                }

                final weightInKg = double.tryParse(weightText);
                if (weightInKg == null || weightInKg <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Geçerli bir ağırlık giriniz.')),
                  );
                  return;
                }

                final weightInKgConverted = weightInKg / 1000;
                final totalPrice = weightInKgConverted * pricePerKg;

                final cartItem = CartItem(
                  name: productName,
                  weightInKg: weightInKgConverted,
                  price: totalPrice,
                  imageUrl: imageUrl,
                );

                ref.read(cartProvider.notifier).addToCart(cartItem);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$productName sepete eklendi!')),
                );
                Navigator.pop(context);
              },
              child: Text('Sepete Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
