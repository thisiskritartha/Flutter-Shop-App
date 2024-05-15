import 'package:flutter/material.dart';
import 'package:internship/controllers/produtct_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductViews extends StatelessWidget {
  ProductViews({Key? key}) : super(key: key);
  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'onlineStore'.tr,
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Obx(
            () => IconButton(
                icon: Icon(
                  Icons.view_list_rounded,
                  color: productController.isTileSelected.value
                      ? Colors.grey
                      : Colors.black,
                ),
                onPressed: () {
                  productController.isTile.value = false;
                  productController.isTileSelected.value = false;
                }),
          ),
          Obx(
            () => IconButton(
                icon: Icon(
                  Icons.grid_view,
                  color: productController.isTileSelected.value
                      ? Colors.black
                      : Colors.grey,
                ),
                onPressed: () {
                  productController.isTile.value = true;
                  productController.isTileSelected.value = true;
                }),
          ),
        ],
      ),
    );
  }
}
