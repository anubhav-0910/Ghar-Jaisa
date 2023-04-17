// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:project_s4/constants/global_variables.dart';
import 'package:project_s4/features/home/screens/category_screen.dart';

class CategoryBuildCard extends StatelessWidget {
  const CategoryBuildCard({super.key});

  void openCategoriesScreen(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        itemCount: GlobalVariables.categoriesList.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 35,
        ),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Card(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                openCategoriesScreen(
                  context,
                  GlobalVariables.categoriesList[index],
                );
              },
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(
                      GlobalVariables.categoryImages[index]['image']!,
                    ),
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      GlobalVariables.categoriesList[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
