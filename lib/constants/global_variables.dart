import 'package:flutter/material.dart';

String uri = 'http://10.0.0.99:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);

  static var selectedNavBarColor = const Color.fromRGBO(255, 153, 0, 1);

  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<String> categoriesList = [
    "Main Course",
    "Biryani",
    "South Indian & Mini Meal",
    "Starters",
    "Choice Of Dal",
    "Breads",
    "Rice",
    "Chinese",
    "Burgers and Sandwiches"
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': "Main Course",
      'image':
          'https://thumbs.dreamstime.com/z/indian-vegetarian-meal-north-indian-main-course-indian-veg-meal-consisting-dal-fry-lentils-along-fried-potatoes-112712018.jpg',
    },
    {
      'title': "Biryani",
      'image':
          'https://media.istockphoto.com/id/469866881/photo/mutton-gosht-biryani.jpg?s=612x612&w=0&k=20&c=FH6dExVNp_hb9JtJCyGrmKAhPJwQo3UdlMC6gHCbVLg=',
    },
    {
      'title': "South Indian & Mini Meal",
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/6/68/Tamil_Nadu_Non-Vegetarian_Meals.png',
    },
    {
      'title': "Starters",
      'image':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dinner-party-starters-1627381380.jpg?crop=1.00xw:1.00xh;0,0&resize=980:*',
    },
    {
      'title': "Choice Of Dal",
      'image':
          'https://www.daringgourmet.com/wp-content/uploads/2013/06/Masoor-Dal-4-square-728x728.jpg',
    },
    {
      'title': "Breads",
      'image':
          'https://assets.bonappetit.com/photos/5c62e4a3e81bbf522a9579ce/1:1/w_1920,c_limit/milk-bread.jpg',
    },
    {
      'title': "Rice",
      'image':
          'https://www.yummytummyaarthi.com/wp-content/uploads/2018/01/IMG_8232.jpg',
    },
    {
      'title': "Chinese",
      'image':
          'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/02/07/15/chinese.jpg?quality=75&width=990&crop=1714%3A1143%2Csmart&auto=webp',
    },
    {
      'title': "Burgers and Sandwiches",
      'image':
          'https://www.recipetineats.com/wp-content/uploads/2022/08/Stack-of-cheeseburgers.jpg',
    },
  ];
}
