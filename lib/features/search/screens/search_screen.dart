import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/loader.dart';
import 'package:project_s4/features/search/services/search_service.dart';

import '../../../models/product.dart';
import '../../home/widgets/food_searchbar.dart';
import '../widgets/searched_product.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProducts();
  }

  fetchSearchedProducts() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
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
      body: products == null
          ? const Loader()
          : products!.isEmpty
              ? Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 200,
                        ),
                        Icon(
                          Icons.search,
                          size: 200,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                            height: 100,
                            width: 500,
                            child: Center(
                              child: Text(
                                  "Try Searching the item with a different keyword"),
                            )),
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 10, top: 10, right: 7, bottom: 20),
                      child: FoodSearchBar(),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Card(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  elevation: 0,
                                  child: SearchedProduct(
                                    product: products![index],
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
