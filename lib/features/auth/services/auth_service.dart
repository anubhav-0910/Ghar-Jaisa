// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_s4/features/home/screens/home_screen.dart';
import 'package:project_s4/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/user.dart';
import 'package:http/http.dart' as http;
import '../../../constants/global_variables.dart';
import '../../../constants/error_handling.dart';
import '../../../constants/utils.dart';

class AuthService {
  //SIGN UP USER
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          user: '',
          type: '',
          token: '');

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Account Created!');
            //**********************************SIGN IN USER**************************88

            try {
              http.Response res = await http.post(Uri.parse('$uri/api/signin'),
                  body: jsonEncode({'email': email, 'password': password}),
                  headers: <String, String>{
                    'Content-Type': 'application/json; chatset=UTF-8',
                  });
              httpErrorHandle(
                  response: res,
                  context: context,
                  onSuccess: () async {
                    //Getting instance
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    //Saving Data
                    Provider.of<UserProvider>(context, listen: false)
                        .setUser(res.body);
                    //Setting auth token
                    await prefs.setString(
                        'x-auth-token', jsonDecode(res.body)['token']);
                    //Navigating to the Home Screen
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => false,
                    );
                  });
            } catch (e) {
              showSnackBar(context, e.toString());
            }

            //**************************************************************** */
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //SIGN IN USER
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            //Getting instance
            SharedPreferences prefs = await SharedPreferences.getInstance();
            //Saving Data
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            //Setting auth token
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            //Navigating to the Home Screen
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //GET USER DATA FOR TOKEN
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; chatset=UTF-8',
              'x-auth-token': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
