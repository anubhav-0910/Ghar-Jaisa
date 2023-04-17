import 'package:flutter/material.dart';

class AddToCartMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
