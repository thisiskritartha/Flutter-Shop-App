import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controllers/produtct_controller.dart';
import 'package:internship/models/product.dart';
import 'package:internship/views/detail_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  ProductController productController = Get.find<ProductController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
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
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<Product> result = [];
    for (var product in productController.productList) {
      if (product.title.toLowerCase().contains(query.toLowerCase())) {
        result.add(product);
      }
    }
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        var res = result[index];
        return GestureDetector(
          onTap: () {
            Get.to(
              Detail(product: res, tag: 'details'),
            );
          },
          child: ListTile(
            title: Text(res.title),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<Product> result = [];
    for (var product in productController.productList) {
      if (product.title.toLowerCase().contains(query.toLowerCase())) {
        result.add(product);
      }
    }
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          var res = result[index];
          return GestureDetector(
            onTap: () {
              Get.to(
                Detail(product: res, tag: 'details_page'),
              );
            },
            child: ListTile(
              title: Text(
                res.title,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        });
  }
}
