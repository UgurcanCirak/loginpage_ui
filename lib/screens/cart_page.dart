import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_summary.dart';

class CartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final totalAmount = ref.read(cartProvider.notifier).getTotalAmount();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sepetim'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Sepetiniz boş'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      leading:
                          Image.asset(item.imageUrl, width: 50, height: 50),
                      title: Text(item.name),
                      subtitle:
                          Text('${item.weightInKg.toStringAsFixed(2)} kg'),
                      trailing: Text('₺${item.price.toStringAsFixed(2)}'),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: CartSummary(totalAmount: totalAmount),
    );
  }
}
