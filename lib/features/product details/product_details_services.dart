import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_s4/constants/error_handling.dart';
import 'package:project_s4/constants/global_variables.dart';
import 'package:project_s4/constants/utils.dart';
import 'package:project_s4/models/user.dart';
import 'package:project_s4/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../models/product.dart';

class ProductDetailsServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
          showSnackBar(context, "Successfully added to cart");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
