import 'package:get/get.dart';
import 'package:internship/services/remote_services.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var productList = <Product>[]
      .obs; // Observable list of products fetched through Fakestore API

  var cartList = <Product>[].obs; // Observable list of products in the cart

  RxBool isTile = RxBool(
      true); // Observable boolean to determine the view style (Tile or other)

  RxBool isTileSelected =
      RxBool(true); // Observable boolean to track if a tile is selected

  @override
  void onInit() {
    // Fetch products from the remote API when the controller is initialized
    fetchProduct();
    super.onInit();
  }

  // Fetch products from the remote API
  void fetchProduct() async {
    List<Product>? products = await RemoteServices
        .fetchProducts(); // Use the RemoteServices class to fetch products

    productList.value =
        products!; // Update the observable list with the fetched products
  }

  // Add a product to the cart
  void addToCart(Product product) {
    // Check if the product is not already in the cart
    if (!cartList.contains(product)) {
      cartList.add(product); // Add the product to the cart

      // Show a snackbar indicating the successful addition to the cart
      Get.snackbar(
          'cartList'.tr, '${product.title} added to cart successfully.');
    }
  }

  // Remove a product from the cart
  void removeFromCart(Product product) {
    // Check if the product is in the cart
    if (cartList.contains(product)) {
      cartList.remove(product); // Remove the product from the cart

      // Show a snackbar indicating the successful removal from the cart
      Get.snackbar(
        'cartList'.tr,
        '${product.title} from cart list removed successfully.',
      );
    }
  }

  // Clear all products from the cart
  void clearCartList() {
    cartList.clear(); // Clear the cart list

    // Show a snackbar indicating the successful clearing of the cart
    Get.snackbar(
      'cartList'.tr,
      'Cart list cleared successfully.',
    );
  }
}
