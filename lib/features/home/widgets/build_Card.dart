import 'package:flutter/material.dart';
import './food_detail_sheet.dart';

class buildCard extends StatelessWidget {
  const buildCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(
          width: 35,
        ),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Card(
            color: Colors.white,
            child: Column(
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/malai_chaap.jpeg',
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        context: context,
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                            heightFactor: 0.7,
                            child: FoodDetailSheet(),
                          );
                        },
                        elevation: 5,
                        isScrollControlled: true);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'Malai Chaap',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const Text(
                  '120 ₹',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
