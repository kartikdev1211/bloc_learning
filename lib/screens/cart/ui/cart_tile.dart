// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:learning_bloc/screens/cart/bloc/cart_bloc.dart';
import 'package:learning_bloc/screens/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ " + productDataModel.price.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(ProductsWishlistButtonClicked(
                      //     clickedModel: productDataModel));
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(ProductsCartButtonClicked(
                      //     clickedModel: productDataModel));
                      cartBloc.add(CartRemoveFromEvent(productDataModel));
                    },
                    icon: const Icon(
                      Icons.shopping_cart_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
