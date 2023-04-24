import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../services/home_services.dart';
import '../../home/widgets/add_to_cart_button.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category-deals-screen';
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            widget.category,
            style: const TextStyle(
                color: Color.fromARGB(200, 50, 53, 51),
                fontWeight: FontWeight.w600,
                fontSize: 19),
          ),
        ),
        toolbarHeight: 55,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: productList == null
          ? const CircularProgressIndicator()
          : Column(
              children: [
                // const Padding(
                //   padding:
                //       EdgeInsets.only(left: 10, top: 10, right: 7, bottom: 20),
                //   child: FoodSearchBar(),
                // ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: productList!.length,
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () {
                            print(product.name);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Card(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  elevation: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10, left: 13),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            product.images[0],
                                            fit: BoxFit.cover,
                                            height: 70,
                                            width: 70,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 150,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              product.name,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                              maxLines: 2,
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 5),
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
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              product.category,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 2),
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
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        alignment: Alignment.centerLeft,
                                        height: 50,
                                        width: 130,
                                        child: AddToCartMenu(
                                          product,
                                          context,
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
