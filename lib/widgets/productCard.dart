import 'package:api_app/models/product_model.dart';
import 'package:api_app/product_details_view.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, this.productsModel}) : super(key: key);

  ProductsModel? productsModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productsModel!.image))),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productsModel!.title,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("GH₵ ${productsModel!.price}"),
                    InkWell(
              child: const Text(
                "View more",
                style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailsView(productsModel: productsModel,)));
              },
            )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
