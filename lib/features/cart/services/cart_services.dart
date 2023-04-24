// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_s4/constants/error_handling.dart';
import 'package:project_s4/constants/utils.dart';
import 'package:project_s4/models/product.dart';
import 'package:project_s4/models/user.dart';
import 'package:project_s4/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';

class CartServices {
  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/api/remove-from-cart/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
          showSnackBar(context, "Successfully deleted from cart");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void deleteFromCart({
    required BuildContext context,
    required String productId,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/api/remove-from-cart/$productId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
          showSnackBar(context, "Successfully deleted from cart");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
