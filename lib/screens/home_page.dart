import 'package:flutter/material.dart';
import 'product_category_page.dart';
import '../data/product_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategoriler'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProductButton(
            title: 'Tavuk',
            image: 'images/tavuk.png',
            targetPage: ProductCategoryPage(
              products: chickenProducts,
              category: 'Tavuk',
            ),
          ),
          ProductButton(
            title: 'Kırmızı Et',
            image: 'images/kırmızı_et.jpg',
            targetPage: ProductCategoryPage(
              products: redMeatProducts,
              category: 'Kırmızı Et',
            ),
          ),
        ],
      ),
    );
  }
}

class ProductButton extends StatelessWidget {
  final String title;
  final String image;
  final Widget targetPage;

  ProductButton({
    required this.title,
    required this.image,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => targetPage));
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: 280,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
