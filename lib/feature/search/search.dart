import 'package:e_commerce/feature/detailsprodect/detailsprodect.dart';
import 'package:e_commerce/feature/home/getprodect.dart';
import 'package:e_commerce/feature/home/models/modelproduct.dart';
import 'package:e_commerce/feature/home/widget/rowcategorices.dart';
import 'package:flutter/material.dart';

class Searchpage extends SearchDelegate<ProductModel?> {
  late Future<List<ProductModel>> productsFuture;

  Searchpage() {
    productsFuture = getProducts();
  }

  @override
  String get searchFieldLabel => 'Search Products,Brands....';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xffF5F5F5),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(
        margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear, size: 20),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded, size: 22),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final allProducts = snapshot.data ?? [];

        final filter = allProducts.where((p) {
          return p.name.toLowerCase().contains(query.toLowerCase());
        }).toList();

        if (filter.isEmpty) {
          return const Center(
            child: Text(
              'No results found',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          itemCount: filter.length,
          itemBuilder: (context, index) {
            final product = filter[index];

            return ListTile(
              title: Text(product.name),
              subtitle: Text(product.prands),
              leading: Image.network(
                product.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              trailing: Text('${product.numrating.round()}K'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailsprodect(detailprod: product),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Column(
        children: [
          const SizedBox(height: 20),

          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryCard(title: 'Shoes', icon: "👟"),
                SizedBox(width: 12),
                CategoryCard(title: 'Tech', icon: "📱"),
                SizedBox(width: 12),
                CategoryCard(title: 'Fashion', icon: "👗"),
                SizedBox(width: 12),
                CategoryCard(title: 'Home', icon: "🏠"),
                SizedBox(width: 12),
                CategoryCard(title: 'Beauty', icon: "💄"),
                SizedBox(width: 12),
                CategoryCard(title: 'Sports', icon: "⚽"),
                SizedBox(width: 12),
                CategoryCard(title: 'Books', icon: "📚"),
                SizedBox(width: 12),
                CategoryCard(title: 'Toys', icon: "🧸"),
              ],
            ),
          ),

          const Expanded(
            child: Center(
              child: Text(
                "Search for products...",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      );
    }

    return FutureBuilder<List<ProductModel>>(
      future: productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final allProducts = snapshot.data ?? [];

        final filter = allProducts.where((p) {
          return p.name.toLowerCase().contains(query.toLowerCase());
        }).toList();

        if (filter.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("🔍", style: TextStyle(fontSize: 60)),
                SizedBox(height: 30),
                Text(
                  "No results found",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                Text(
                  "Try different keywords or browse categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: RichText(
                text: TextSpan(
                  text: '${filter.length} ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    const TextSpan(
                      text: 'results for ',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: '($query)',
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: filter.length,
                itemBuilder: (context, index) {
                  final product = filter[index];

                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.prands),
                    leading: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    trailing: Text('${product.numrating.round()}K'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Detailsprodect(detailprod: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
