import 'package:e_commerce/data.dart';
import 'package:e_commerce/feature/detailsprodect/detailsprodect.dart';
import 'package:e_commerce/feature/home/models/modelproduct.dart';
import 'package:flutter/material.dart';

class Searchpage extends SearchDelegate<ProductModel?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filter = products.where((p) {
      return p.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filter.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 40),
            SizedBox(height: 10),
            Text("No results found"),
            Text("Try different keywords or browse categories"),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: filter.length,
      itemBuilder: (context, index) {
        final product = filter[index];

        return ListTile(
          title: Text(product.name),
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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filter = products.where((p) {
      return p.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (query.isEmpty) {
      return const Center(
        child: Text(
          "Search for products...",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight(600)),
        ),
      );
    }

    if (filter.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 60, color: Colors.blue),
            SizedBox(height: 30),
            Text(
              "No results found",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight(600)),
            ),
            SizedBox(height: 15),
            Text(
              "Try different keywords or browse categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight(300)),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Text(
            "${filter.length} results for $query",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight(300)),
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
                leading: Image.network(product.image),
                trailing: Text("${product.numrating.round().toString()}K"),
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
          ),
        ),
      ],
    );
  }
}
