import 'package:flutter/material.dart';
//import 'package:project_s4/features/home/widgets/food_searchbar.dart';
import 'package:project_s4/features/orders/screens/order_details_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:intl/intl.dart';

class OrdersHistoryScreen extends StatelessWidget {
  static const routeName = '/orders-history';
  String formattedDate =
      DateFormat('dd MMM yyyy @ h:mm a').format(DateTime.now()).toString();
  final List<String> orders = [
    'OrderName 1',
    'OrderName 2',
    'OrderName 3',
    'OrderName 4',
    'OrderName 5',
    'OrderName 6',
    'OrderName 7',
    'OrderName 8',
    'OrderName 9',
    'OrderName 10',
  ];

  OrdersHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Order History',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          // Build a card for each order item
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OrderDetailsScreen(orderNumber: orders[index]),
                ),
              );
            },
            child: Container(
              height: 135,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/malai_chaap.jpeg',
                              fit: BoxFit.cover,
                              height: 60,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 35),
                          child: Image.asset(
                            width: 18,
                            'assets/images/veg.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Text('1 x ${orders[index]}',
                                  softWrap: true,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              const Text('Dharwad-Hubli Locality',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey))
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 30),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(' Delivered_',
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 12,
                                  backgroundColor: Colors.black12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                        )
                      ],
                    ),
                    const DottedLine(dashColor: Colors.black26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            formattedDate,
                            style: const TextStyle(
                                color: Color.fromARGB(200, 50, 53, 51),
                                fontWeight: FontWeight.w600,
                                fontSize: 10),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(9.0),
                          child: Text(
                            '₹120.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
