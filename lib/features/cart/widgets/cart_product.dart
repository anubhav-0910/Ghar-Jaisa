import 'package:flutter/material.dart';
import 'package:project_s4/features/product%20details/product_details_services.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../providers/user_provider.dart';
import '../services/cart_services.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  final CartServices cartServices = CartServices();

  void increaseQuantity(Product product) {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );
    setState(() {});
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];

    return
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.grey.withOpacity(0.2),
        //           spreadRadius: 3,
        //           blurRadius: 10,
        //           offset: const Offset(0, 3),
        //         )
        //       ],
        //     ),
        //     child: Row(
        //       children: [
        //         Padding(
        //           padding: EdgeInsets.all(1),
        //           child: ListTile(
        //             leading: const CircleAvatar(
        //               radius: 20,
        //               backgroundImage: NetworkImage(
        //                   'https://via.placeholder.com/150'), // replace with actual image URL
        //             ),
        //             title:
        //                 Text(' ${product.name}'), // replace with actual item name
        //             subtitle:
        //                 Text('${product.price}'), // replace with actual item price
        //             trailing: IconButton(
        //               icon: const Icon(
        //                 Icons.remove_circle,
        //                 color: Colors.orange,
        //               ),
        //               onPressed: () {
        //                 decreaseQuantity(product);
        //               },
        //             ),
        //           ),
        //         ),
        //         ElevatedButton(
        //           onPressed: null,
        //           child: Text("hlelo"),
        //         )
        //       ],
        //     ),
        //   ),
        // );
        Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    product.images[0],
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => decreaseQuantity(product),
                        child: Container(
                          width: 35,
                          height: 32,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.remove,
                            size: 18,
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1.5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Container(
                          width: 35,
                          height: 32,
                          alignment: Alignment.center,
                          child: Text(
                            quantity.toString(),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => increaseQuantity(product),
                        child: Container(
                          width: 35,
                          height: 32,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
