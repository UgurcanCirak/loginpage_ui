class CartItem {
  final String name;
  final double weightInKg;
  final double price;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.weightInKg,
    required this.price,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weightInKg': weightInKg,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'],
      weightInKg: (json['weightInKg'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
    );
  }
}
