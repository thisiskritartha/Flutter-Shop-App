import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class RemoteServices {
  // Create a static instance of the HTTP client
  static var client = http.Client();

  // Fetch a list of products from a remote API
  // Returns a List<Product> if successful, otherwise null
  static Future<List<Product>?> fetchProducts() async {
    try {
      // Send a GET request to the remote API
      var response =
          await client.get(Uri.parse('http://fakestoreapi.com/products'));

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response into a list of Product objects
        var jsonString = response.body;
        return productFromJson(jsonString);
      } else {
        // Display an error message using Get.snackbar if the request is not successful
        Get.snackbar('${response.statusCode}',
            'Error in fetching the Data. Please try again later.');
        return null;
      }
    } catch (error) {
      // Display an error message using Get.snackbar if an exception occurs
      Get.snackbar('Error', 'Failed to fetch products. $error');
      return null;
    }
  }
}
