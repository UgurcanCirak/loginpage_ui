import 'package:flutter/material.dart';
import 'package:loginpage_ui/screens/location_page.dart';
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
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
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
          ProductButton(
            title: 'Mangal Malzemeleri',
            image: 'images/mangal.jpeg',
            targetPage: ProductCategoryPage(
              products: grillProducts, // Mangal ürünler listesi
              category: 'Mangal Malzemeleri',
            ),
          ),
          ProductButton(
            title: 'Baharatlar',
            image: 'images/baharat.jpg',
            targetPage: ProductCategoryPage(
              products: spicesProducts, // Baharat ürünler listesi
              category: 'Baharatlar',
            ),
          ),
          ProductButton(
            title: 'İşletme Lokasyonlarımız',
            image: 'images/lokasyon.jpeg',
            targetPage: MapSample(), // Lokasyonlar sayfası
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
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
