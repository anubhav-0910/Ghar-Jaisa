import 'package:flutter/material.dart';
import 'package:project_s4/features/home/screens/notifications.dart';
import 'package:project_s4/features/home/screens/view_all.dart';
import '../widgets/build_Card.dart';
import '../widgets/category_build_card.dart';
import '../widgets/food_searchbar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(15)),
                const Expanded(
                  child: Text('Find Your Favourite Food',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left),
                ),
                Card(
                  margin: const EdgeInsets.all(25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, NotificationPage.routeName);
                      },
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.orange,
                        size: 30,
                      )),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const FoodSearchBar(),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Nearest Restaurant',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ViewAllScreen.routeName);
                        },
                        child: const Text(
                          'View More',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const buildCard(),
                  const buildCard(),

                  //Categories Of Food Items
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Categories',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const CategoryBuildCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

































// // import 'dart:js_interop';

// import 'package:flutter/material.dart';
// import 'package:project_s4/providers/user_provider.dart';
// import 'package:provider/provider.dart';

// class HomeSceen extends StatefulWidget {
//   static const routeName = '/home-screen';
//   const HomeSceen({super.key});

//   @override
//   State<HomeSceen> createState() => _HomeSceenState();
// }

// class _HomeSceenState extends State<HomeSceen> {
//   @override
//   //getter for user data
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context).user;
//     return Scaffold(
//       body: Center(
//         child: Text(
//           user.toJson(),
//         ),
//       ),
//     );
//   }
// }
