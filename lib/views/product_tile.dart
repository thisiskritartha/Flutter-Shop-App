import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controllers/produtct_controller.dart';
import 'package:internship/widgets/fav_icon.dart';
import '../models/product.dart';
import 'detail_page.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  final Product product;
  final String heroTag;
  ProductTile(this.product, {super.key, required this.heroTag});

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          Detail(
            product: product,
            tag: heroTag,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: heroTag,
                  child: Container(
                    height: 180.0,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: CachedNetworkImage(imageUrl: product.image),
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: FavIcon(product: product),
                )
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              product.title,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.0),
            Text('\$${product.price}', style: TextStyle(fontSize: 32.0)),
          ],
        ),
      ),
    );
    //);
  }
}
