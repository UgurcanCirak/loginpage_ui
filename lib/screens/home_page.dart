import 'package:flutter/material.dart';
import 'package:loginpage_ui/screens/location_page.dart';
import 'product_category_page.dart';
import '../data/product_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Köy Kasabı'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              // Profile sayfası
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFD32F2F).withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kategoriler',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD32F2F),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Taze ve kaliteli ürünlerimizi keşfedin',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildListDelegate([
                  CategoryCard(
                    title: 'Tavuk',
                    image: 'images/tavuk.png',
                    icon: Icons.egg_outlined,
                    color: const Color(0xFFFF6B6B),
                    targetPage: ProductCategoryPage(
                      products: chickenProducts,
                      category: 'Tavuk',
                    ),
                  ),
                  CategoryCard(
                    title: 'Kırmızı Et',
                    image: 'images/kırmızı_et.jpg',
                    icon: Icons.set_meal_outlined,
                    color: const Color(0xFFD32F2F),
                    targetPage: ProductCategoryPage(
                      products: redMeatProducts,
                      category: 'Kırmızı Et',
                    ),
                  ),
                  CategoryCard(
                    title: 'Mangal',
                    image: 'images/mangal.jpeg',
                    icon: Icons.outdoor_grill_outlined,
                    color: const Color(0xFFFF8A65),
                    targetPage: ProductCategoryPage(
                      products: grillProducts,
                      category: 'Mangal Malzemeleri',
                    ),
                  ),
                  CategoryCard(
                    title: 'Baharatlar',
                    image: 'images/baharat.jpg',
                    icon: Icons.grass_outlined,
                    color: const Color(0xFFFF7043),
                    targetPage: ProductCategoryPage(
                      products: spicesProducts,
                      category: 'Baharatlar',
                    ),
                  ),
                  const CategoryCard(
                    title: 'Lokasyonlar',
                    image: 'images/lokasyon.jpeg',
                    icon: Icons.location_on_outlined,
                    color: Color(0xFF5C6BC0),
                    targetPage: MapSample(),
                  ),
                ]),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final IconData icon;
  final Color color;
  final Widget targetPage;

  const CategoryCard({
    super.key,
    required this.title,
    required this.image,
    required this.icon,
    required this.color,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Hero(
        tag: 'category_$title',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: color.withOpacity(0.2),
                      child: Icon(icon, size: 60, color: color),
                    );
                  },
                ),

                // Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      stops: const [0.5, 1.0],
                    ),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          icon,
                          color: color,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Keşfet',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
