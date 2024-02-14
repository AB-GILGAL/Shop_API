import 'package:api_app/models/product_model.dart';
import 'package:http/http.dart';

class ProductsNetwork {
  // String url = "https://api.escuelajs.co/api/v1/products";
  String url = "https://fakestoreapi.com/products";

  // get data from server
  Future <List<ProductsModel>> getProducts() async {
    final response = await get(Uri.parse(url));
    // if the get request is succesful

    if (response.statusCode == 200) {
      return productsModelFromJson(response.body);
    } else {
      throw {Exception("Failed to get from $url")};
    }
  }
}
