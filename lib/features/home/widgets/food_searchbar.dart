import 'package:flutter/material.dart';

import '../../search/screens/search_screen.dart';

class FoodSearchBar extends StatefulWidget {
  const FoodSearchBar({super.key});

  @override
  State<FoodSearchBar> createState() => _FoodSearchBarState();
}

class _FoodSearchBarState extends State<FoodSearchBar> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onFieldSubmitted: navigateToSearchScreen,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 251, 240, 228),
              hintText: 'What do you want to order?',
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 215, 162, 93)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Color.fromARGB(255, 155, 93, 0),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 251, 240, 228),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            color: const Color.fromARGB(255, 198, 123, 12),
            alignment: Alignment.center,
            icon: const Icon(
              Icons.format_list_bulleted_sharp,
              size: 26,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
