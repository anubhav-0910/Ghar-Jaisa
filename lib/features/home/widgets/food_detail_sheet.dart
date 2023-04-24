import 'package:flutter/material.dart';
import './food_title_widget.dart';

class FoodDetailSheet extends StatefulWidget {
  @override
  _FoodDetailSheetState createState() => _FoodDetailSheetState();
}

class _FoodDetailSheetState extends State<FoodDetailSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.cancel,
                textDirection: TextDirection.rtl,
                color: Colors.black45,
                size: 35,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/malai_chaap.jpeg',
              fit: BoxFit.cover,
              height: 260,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Align(
              heightFactor: 0,
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                width: 20,
                'assets/images/veg.png',
              ),
            ),
          ),
          FoodTitleWidget(
            productName: "Khaana",
            productPrice: '100 ₹',
            productDescription:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          ),
        ],
      ),
    );
  }
}
