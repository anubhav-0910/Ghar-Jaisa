import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderNumber;

  OrderDetailsScreen({required this.orderNumber});

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
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Order Details',
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
      body: Center(
        child: Text('Order Details for $orderNumber'),
      ),
    );
  }
}
