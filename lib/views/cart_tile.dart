import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:internship/widgets/grid_views.dart';
import 'package:internship/widgets/product_views.dart';
import '../controllers/produtct_controller.dart';

class CartList extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'cartList'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              productController.clearCartList();
            },
            icon: const Icon(Icons.clear_sharp),
          )
        ],
      ),
      body: Column(
        children: [
          ProductViews(),
          CustomGridViews(list: productController.cartList),
        ],
      ),
    );
  }
}
