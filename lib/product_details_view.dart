import 'package:api_app/models/product_model.dart';
import 'package:api_app/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailsView extends StatefulWidget {
  ProductsModel? productsModel;
  ProductDetailsView({Key? key, required this.productsModel}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

ProductsModel? productsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.productsModel!.image))
              ),
              height: MediaQuery.of(context).size.height/4,
              
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.productsModel!.title,
                        style: const TextStyle(
                  overflow: TextOverflow.ellipsis
                ),),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("GH₵ ${widget.productsModel!.price}"),
                             Row(
                      children: [
                        ratingStar(),
                        ratingStar(),
                        ratingStar(),
                        ratingStar(),
                        ratingStar(),
                      ],
                    )
                           ],
                         ),
                      ],
                    ),
                   const SizedBox(height: 10,),
                    Text("Description: ${widget.productsModel!.description}"),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.teal),
                      onPressed: (){},
                       child: const Text("Add to Cart",
                       style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Icon ratingStar() => const Icon(Icons.star, color: Colors.yellow,);
}
