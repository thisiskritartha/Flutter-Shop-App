import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controllers/produtct_controller.dart';
import '../models/product.dart';

// ignore: must_be_immutable
class FavIcon extends StatelessWidget {
  final Product product;
  FavIcon({Key? key, required this.product}) : super(key: key);
  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: product.isFavorite.value
            ? const Icon(Icons.favorite_rounded)
            : const Icon(Icons.favorite_border),
        onPressed: () {
          product.isFavorite.toggle();
          product.isFavorite.value
              ? productController.addToCart(product)
              : productController.removeFromCart(product);
        },
      ),
    );
  }
}
