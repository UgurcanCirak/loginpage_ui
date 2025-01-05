import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/cart_item.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  CartNotifier(this.userId) : super([]) {
    loadCart(); // Kullanıcının mevcut sepetini Firestore'dan yükle
  }

  Future<void> addToCart(CartItem item) async {
    state = [...state, item];
    await _updateFirestore();
  }

  Future<void> removeFromCart(CartItem item) async {
    state = state.where((cartItem) => cartItem != item).toList();
    await _updateFirestore();
  }

  Future<void> loadCart() async {
    final cartDoc = await _firestore.collection('carts').doc(userId).get();
    if (cartDoc.exists) {
      final items = cartDoc.data()?['items'] as List<dynamic>?;
      if (items != null) {
        state = items.map((item) => CartItem.fromJson(item)).toList();
      }
    }
  }

  double getTotalAmount() {
    return state.fold(0.0, (total, item) => total + item.price);
  }

  Future<void> _updateFirestore() async {
    await _firestore.collection('carts').doc(userId).set({
      'items': state.map((item) => item.toJson()).toList(),
    });
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw StateError('Kullanıcı girişi gerekli!');
  }
  return CartNotifier(user.uid);
});
