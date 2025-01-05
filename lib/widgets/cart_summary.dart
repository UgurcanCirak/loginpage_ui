import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final double totalAmount;

  const CartSummary({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Toplam Tutar: ₺${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Sepeti onaylama işlemi buraya gelecek
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            child: Text(
              'Sepeti Onayla',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
