import 'package:flutter/material.dart';

import 'package:project_s4/features/product%20details/product_details_services.dart';
import 'package:project_s4/models/product.dart';

class AddToCartMenu extends StatelessWidget {
  final Product product;
  final BuildContext context;
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  AddToCartMenu(
    this.product,
    this.context,
  );

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: addToCart,
      child: Container(
        width: 90.0,
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(width: 0.6, color: Colors.grey),
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: const Center(
          child: Text(
            'ADD',
            style: TextStyle(
                fontSize: 13.0,
                color: Colors.green,
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
