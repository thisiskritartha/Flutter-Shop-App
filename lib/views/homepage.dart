import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/views/cart_tile.dart';
import 'package:internship/widgets/product_views.dart';
import '../controllers/produtct_controller.dart';
import '../widgets/grid_views.dart';
import 'custom_search_delegate.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  HomePage({super.key});

  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'नेपाली', 'locale': const Locale('ne', 'NE')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('chooseLanguage'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },
                      child: Text(locale[index]['name']),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(color: Colors.grey);
                },
                itemCount: locale.length,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Get.to(CartList());
          },
        ),
        title: Text(
          'homePage'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              buildDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ProductViews(),
          CustomGridViews(list: productController.productList),
        ],
      ),
    );
  }
}
