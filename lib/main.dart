import 'package:api_app/models/product_model.dart';
import 'package:api_app/network/products_request.dart';
import 'package:api_app/widgets/productCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ShoppingHomePage(),
  ));
}

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({Key? key}) : super(key: key);

  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  Future<List<ProductsModel>>? productsData;

  ProductsNetwork productsNetwork = ProductsNetwork();

  @override
  void initState() {
    productsData = productsNetwork.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API_SHOP"),
      ),
      body: FutureBuilder<List<ProductsModel>>(
        future: productsData,
        builder: (context, snapshot) {
          // wait for data from snapshot
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
            // when done waiting and yet the data is null
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return const Center(
              child: Text(
                  "Oops, something went wrong. Check your connection and try again.",
                  textAlign: TextAlign.center,),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ProductCard(productsModel: snapshot.data![index],),
            );
          }
        },
      ),
    );
  }
}
