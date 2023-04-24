import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/loader.dart';
import 'package:project_s4/features/search/services/search_service.dart';

import '../../../models/product.dart';
import '../../home/widgets/food_searchbar.dart';
import '../widgets/add_to_cart_button.dart';

class ViewAllScreen extends StatefulWidget {
  static const routeName = '/view-all-screen';

  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(247, 255, 255, 255),
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
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Showing search results',
            style: TextStyle(
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 7, bottom: 20),
            child: FoodSearchBar(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 13),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/malai_chaap.jpeg',
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    'Malai Chaap',
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 5),
                                  child: Text(
                                    '₹ 120.0',
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
                                    'Starters',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 60),
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 130,
                                child: AddToCartMenu(
                                    Product(
                                        name: 'name',
                                        description: 'description',
                                        availability: true,
                                        images: [
                                          'assets/images/malai_chaap.jpeg'
                                        ],
                                        category: 'category',
                                        price: 100),
                                    context))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
