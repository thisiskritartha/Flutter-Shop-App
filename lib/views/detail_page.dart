import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:internship/controllers/produtct_controller.dart';
import 'package:internship/widgets/fav_icon.dart';

import '../models/product.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  final Product product;
  final String tag;
  Detail({Key? key, required this.product, required this.tag})
      : super(key: key);

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'detailPage'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: orientation == Orientation.landscape
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: tag,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          height: height,
                          width: width * 0.3,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.1),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${product.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        Text(
                          product.description,
                          style: TextStyle(
                            color: Colors.grey[600],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FavIcon(product: product),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: tag,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ListTile(
                    title: Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0,
                        color: Colors.grey[800],
                      ),
                    ),
                    trailing: FavIcon(product: product),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      product.description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
