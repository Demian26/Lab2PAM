import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lab2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Stack(
                children: [
                  Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/streetClothes.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 280,
                  ),
                  Positioned(
                    left: 24,
                    bottom: 40,
                    child: Text(
                      'Street clothes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Sale Section
              _buildSectionHeader('Sale', 'Super summer sale'),
              const SizedBox(height: 16),
              SizedBox(
                height: 320,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    ProductCard(
                      image: 'assets/images/eveningDress.png',
                      badge: '-20%',
                      badgeColor: const Color(0xFFDB3022),
                      rating: 5,
                      reviewCount: 10,
                      brand: 'Dorothy Perkins',
                      name: 'Evening Dress',
                      originalPrice: '15\$',
                      salePrice: '12\$',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EveningDressDetailScreen(),
                          ),
                        );
                      },
                    ),
                    ProductCard(
                      image: 'assets/images/sportDress.png',
                      badge: '-15%',
                      badgeColor: const Color(0xFFDB3022),
                      rating: 5,
                      reviewCount: 10,
                      brand: 'Sitlly',
                      name: 'Sport Dress',
                      originalPrice: '22\$',
                      salePrice: '19\$',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SportDressDetailScreen(),
                          ),
                        );
                      },
                    ),
                    ProductCard(
                      image: 'assets/images/shortDress.png',
                      badge: '-20%',
                      badgeColor: const Color(0xFFDB3022),
                      rating: 5,
                      reviewCount: 10,
                      brand: 'H&M',
                      name: 'Short Dress',
                      originalPrice: '24\$',
                      salePrice: '19\$',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShortDressDetailScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // New Section
              _buildSectionHeader('New', 'You\'ve never seen it before!'),
              const SizedBox(height: 16),
              SizedBox(
                height: 320,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    ProductCard(
                      image: 'assets/images/blouse.png',
                      badge: 'NEW',
                      badgeColor: Colors.black,
                      rating: 0,
                      reviewCount: 0,
                      brand: 'OVS',
                      name: 'Blouse',
                      price: '30\$',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BlouseDetailScreen(),
                          ),
                        );
                      },
                    ),
                    ProductCard(
                      image: 'assets/images/T-shirtSailing.png',
                      badge: 'NEW',
                      badgeColor: Colors.black,
                      rating: 0,
                      reviewCount: 0,
                      brand: 'Mango Boy',
                      name: 'T-Shirt Sailing',
                      price: '10\$',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TShirtSailingDetailScreen(),
                          ),
                        );
                      },
                    ),
                    ProductCard(
                      image: 'assets/images/Shirt.png',
                      badge: 'NEW',
                      badgeColor: Colors.black,
                      rating: 0,
                      reviewCount: 0,
                      brand: 'Mango Boy',
                      name: 'Shirt',
                      price: '12\$',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShirtDetailScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Text(
            'View all',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String badge;
  final Color badgeColor;
  final int rating;
  final int reviewCount;
  final String brand;
  final String name;
  final String? originalPrice;
  final String? salePrice;
  final String? price;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.image,
    required this.badge,
    required this.badgeColor,
    required this.rating,
    required this.reviewCount,
    required this.brand,
    required this.name,
    this.originalPrice,
    this.salePrice,
    this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    height: 200,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ...List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    size: 14,
                    color: index < rating ? const Color(0xFFFFBA49) : Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '($reviewCount)',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              brand,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            if (salePrice != null)
              Row(
                children: [
                  Text(
                    originalPrice!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    salePrice!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFDB3022),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            else if (price != null)
              Text(
                price!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Base Product Detail Screen class with common functionality
class BaseProductDetailScreen extends StatelessWidget {
  final String productName;
  final String brand;
  final String description;
  final String imagePath;
  final String originalPrice;
  final String salePrice;
  final String color;

  const BaseProductDetailScreen({
    Key? key,
    required this.productName,
    required this.brand,
    required this.description,
    required this.imagePath,
    required this.originalPrice,
    required this.salePrice,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          productName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            SizedBox(
              height: 380,
              child: PageView(
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Size and Color Selectors
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown('Size'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDropdown(color),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Brand and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            brand,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            productName,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            originalPrice,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            salePrice,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Rating
                  Row(
                    children: [
                      ...List.generate(
                        5,
                            (index) => Icon(
                          Icons.star,
                          size: 16,
                          color: index < 5 ? const Color(0xFFFFBA49) : Colors.grey[300],
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '(10)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDB3022),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Shipping Info & Support
                  Divider(color: Colors.grey[300]),
                  _buildListTile('Shipping info'),
                  Divider(color: Colors.grey[300]),
                  _buildListTile('Support'),
                  Divider(color: Colors.grey[300]),
                  const SizedBox(height: 24),

                  // You can also like this
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'You can also like this',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '12 items',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Similar Products
                  SizedBox(
                    height: 320,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ProductCard(
                          image: 'assets/images/eveningDress.png',
                          badge: '-20%',
                          badgeColor: const Color(0xFFDB3022),
                          rating: 5,
                          reviewCount: 10,
                          brand: 'Dorothy Perkins',
                          name: 'Evening Dress',
                          originalPrice: '15\$',
                          salePrice: '12\$',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EveningDressDetailScreen(),
                              ),
                            );
                          },
                        ),
                        ProductCard(
                          image: 'assets/images/T-shirtSailing.png',
                          badge: 'NEW',
                          badgeColor: Colors.black,
                          rating: 0,
                          reviewCount: 0,
                          brand: 'Mango Boy',
                          name: 'T-Shirt Sailing',
                          price: '10\$',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TShirtSailingDetailScreen(),
                              ),
                            );
                          },
                        ),
                        ProductCard(
                          image: 'assets/images/Shirt.png',
                          badge: 'NEW',
                          badgeColor: Colors.black,
                          rating: 0,
                          reviewCount: 0,
                          brand: 'Mango Boy',
                          name: 'Shirt',
                          price: '12\$',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShirtDetailScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 20),
        ],
      ),
    );
  }

  Widget _buildListTile(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: () {},
    );
  }
}

// Specific product detail screens
class ShortDressDetailScreen extends BaseProductDetailScreen {
  const ShortDressDetailScreen({Key? key}) : super(
    key: key,
    productName: 'Short Dress',
    brand: 'H&M',
    description: 'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
    imagePath: 'assets/images/shortDress.png',
    originalPrice: '\$24',
    salePrice: '\$19',
    color: 'Black',
  );
}

class EveningDressDetailScreen extends BaseProductDetailScreen {
  const EveningDressDetailScreen({Key? key}) : super(
    key: key,
    productName: 'Evening Dress',
    brand: 'Dorothy Perkins',
    description: 'Elegant evening dress perfect for special occasions. Made from high-quality fabric with a flattering fit.',
    imagePath: 'assets/images/eveningDress.png',
    originalPrice: '\$15',
    salePrice: '\$12',
    color: 'Red',
  );
}

class SportDressDetailScreen extends BaseProductDetailScreen {
  const SportDressDetailScreen({Key? key}) : super(
    key: key,
    productName: 'Sport Dress',
    brand: 'Sitlly',
    description: 'Comfortable and stylish sport dress made from breathable fabric. Perfect for workouts and casual wear.',
    imagePath: 'assets/images/sportDress.png',
    originalPrice: '\$22',
    salePrice: '\$19',
    color: 'Blue',
  );
}

class BlouseDetailScreen extends BaseProductDetailScreen {
  const BlouseDetailScreen({Key? key}) : super(
    key: key,
    productName: 'Blouse',
    brand: 'OVS',
    description: 'Elegant blouse made from soft, comfortable fabric. Perfect for both casual and formal occasions.',
    imagePath: 'assets/images/blouse.png',
    originalPrice: '\$30',
    salePrice: '\$30',
    color: 'White',
  );
}

class TShirtSailingDetailScreen extends BaseProductDetailScreen {
  const TShirtSailingDetailScreen({Key? key}) : super(
    key: key,
    productName: 'T-Shirt Sailing',
    brand: 'Mango Boy',
    description: 'Comfortable sailing t-shirt made from high-quality cotton. Features a unique sailing design.',
    imagePath: 'assets/images/T-shirtSailing.png',
    originalPrice: '\$10',
    salePrice: '\$10',
    color: 'Navy',
  );
}

class ShirtDetailScreen extends BaseProductDetailScreen {
  const ShirtDetailScreen({Key? key}) : super(
    key: key,
    productName: 'Shirt',
    brand: 'Mango Boy',
    description: 'Classic shirt made from premium cotton. Perfect for both casual and business casual outfits.',
    imagePath: 'assets/images/Shirt.png',
    originalPrice: '\$12',
    salePrice: '\$12',
    color: 'Light Blue',
  );
}