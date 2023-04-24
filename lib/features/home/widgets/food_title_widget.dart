import 'package:flutter/material.dart';
import 'add_to_cart_button.dart';

// ignore: must_be_immutable
class FoodTitleWidget extends StatelessWidget {
  String productName;
  String productDescription;
  String productPrice;

  FoodTitleWidget({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              // child: AddToCartMenu(product, context),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              productPrice,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            productDescription,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
