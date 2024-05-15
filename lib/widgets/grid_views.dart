import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:internship/controllers/produtct_controller.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../views/product_list.dart';
import '../views/product_tile.dart';

// ignore: must_be_immutable
class CustomGridViews extends StatelessWidget {
  final List<Product> list;
  CustomGridViews({Key? key, required this.list}) : super(key: key);
  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Expanded(
      child: Obx(
        () => MasonryGridView.count(
          crossAxisCount: orientation == Orientation.portrait
              ? (productController.isTile.value ? 2 : 1)
              : (productController.isTile.value ? 3 : 1),
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return productController.isTile.value
                ? ProductTile(
                    list[index],
                    heroTag: 'tileHeroTage${index}',
                  )
                : ProductList(
                    list[index],
                    heroTag: 'listHeroTag${index}',
                  );
          },
        ),
      ),
    );
  }
}
