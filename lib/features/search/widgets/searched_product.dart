import 'package:flutter/material.dart';
import '../../../features/home/widgets/add_to_cart_button.dart';
import '../../../models/product.dart';

// import '../../../common/widgets/stars.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double totalRating = 0;
    // for (int i = 0; i < product.rating!.length; i++) {
    //   totalRating += product.rating![i].rating;
    // }
    // double avgRating = 0;
    // if (totalRating != 0) {
    //   avgRating = totalRating / product.rating!.length;
    // }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 13),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.images[0],
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                product.name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                '₹ ${product.price}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
                maxLines: 2,
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                product.category,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.only(left: 15, top: 2),
              child: product.availability == true
                  ? const Text(
                      "Available",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.teal,
                      ),
                    )
                  : const Text(
                      'Out Of Stock',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.only(left: 60),
            alignment: Alignment.centerLeft,
            height: 50,
            width: 130,
            child: AddToCartMenu(product, context))
      ],
    );
  }
}
