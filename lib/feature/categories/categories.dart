import 'package:e_commerce/feature/categories/widget/getcategoricecolors.dart';
import 'package:e_commerce/feature/categories/widget/rowcateg.dart';
import 'package:e_commerce/feature/home/getprodect.dart';
import 'package:e_commerce/feature/home/models/modelproduct.dart';
import 'package:e_commerce/feature/home/widget/cardprodecthome.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final String titleprod;
  final String iconprod;

  const Categories({
    super.key,
    required this.titleprod,
    required this.iconprod,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String? selectedtitleCategory;
  String? selectediconCategory;

  late Future<List<ProductModel>> productsFuture;

  @override
  void initState() {
    super.initState();

    selectedtitleCategory = widget.titleprod;
    selectediconCategory = widget.iconprod;

    productsFuture = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: productsFuture,
      builder: (context, snapshot) {
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        // المنتجات القادمة من Firebase
        final allProducts = snapshot.data ?? [];

        // فلترة المنتجات حسب القسم
        final selectedProducts = allProducts.where((product) {
          return product.category == selectedtitleCategory;
        }).toList();

        return Scaffold(
          appBar: AppBar(title: const Text("Categories")),

          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 15),

                    // Categories
                    SizedBox(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          CategoriesMain(
                            title: "Shoes",
                            icon: "👟",
                            onTap: () {
                              setState(() {
                                selectedtitleCategory = "Shoes";
                                selectediconCategory = "👟";
                              });
                            },
                          ),

                          const SizedBox(width: 12),

                          CategoriesMain(
                            title: "Tech",
                            icon: "📱",
                            onTap: () {
                              setState(() {
                                selectedtitleCategory = "Tech";
                                selectediconCategory = "📱";
                              });
                            },
                          ),

                          const SizedBox(width: 12),

                          CategoriesMain(
                            title: "Fashion",
                            icon: "👗",
                            onTap: () {
                              setState(() {
                                selectedtitleCategory = "Fashion";
                                selectediconCategory = "👗";
                              });
                            },
                          ),

                          const SizedBox(width: 12),

                          CategoriesMain(
                            title: "Home",
                            icon: "🏠",
                            onTap: () {
                              setState(() {
                                selectedtitleCategory = "Home";
                                selectediconCategory = "🏠";
                              });
                            },
                          ),

                          const SizedBox(width: 12),

                          CategoriesMain(
                            title: "Beauty",
                            icon: "💄",
                            onTap: () {
                              setState(() {
                                selectedtitleCategory = "Beauty";
                                selectediconCategory = "💄";
                              });
                            },
                          ),

                          const SizedBox(width: 12),

                          CategoriesMain(
                            title: "Sports",
                            icon: "⚽",
                            onTap: () {
                              setState(() {
                                selectedtitleCategory = "Sports";
                                selectediconCategory = "⚽";
                              });
                            },
                          ),

                          const SizedBox(width: 12),

                          CategoriesMain(
                            title: "Books",
                            icon: "📚",
                            onTap: () {
                              setState(() {
                                selectedtitleCategory = "Books";
                                selectediconCategory = "📚";
                              });
                            },
                          ),

                          const SizedBox(width: 12),

                          CategoriesMain(
                            title: "Toys",
                            icon: "🧸",
                            onTap: () {
                              setState(() {
                                selectedtitleCategory = "Toys";
                                selectediconCategory = "🧸";
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Selected Category Card
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              getCategoryColor(
                                selectedtitleCategory.toString(),
                              ),
                              getCategoryColor(
                                selectedtitleCategory.toString(),
                              ).withValues(alpha: 0.65),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                selectediconCategory.toString(),
                                style: const TextStyle(fontSize: 32),
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Selected Category",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    selectedtitleCategory.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),

              // No Products
              if (selectedProducts.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "No products found in this category",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              // Products
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.63,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Cardprodecthome(product: selectedProducts[index]);
                    }, childCount: selectedProducts.length),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          ),
        );
      },
    );
  }
}
