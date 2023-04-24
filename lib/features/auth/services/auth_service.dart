// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project_s4/common/screens/congrats.dart';
import 'package:project_s4/common/widgets/bottom_bar.dart';
import 'package:project_s4/features/auth/models/otp_login_response.dart';

import 'package:project_s4/providers/user_provider.dart';
import 'package:project_s4/screens/fill_bio.dart';
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
        token: '',
        verified: 0,
        phone: 0,
        cart: [],
      );
      EmailValidator.validate(email);

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
            //**********************************SIGN IN USER**************************//

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
                    Navigator.pushNamed(
                      context,
                      FillBio.routeName,
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
            Navigator.pushNamed(
              context,
              BottomBar.routeName,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //--------------------------------------FINDING EXISTING USER
  userExists({
    required BuildContext context,
    required String email,
  }) async {
    print("*************************$email");
    http.Response res = await http.get(Uri.parse('$uri/api/findUser/$email'),
        // body: email,
        headers: <String, String>{
          'Content-Type': 'application/json; chatset=UTF-8',
        });
    print(res.statusCode);
    return res.statusCode;
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

  //OTP VERIFICATION
  OtpLoginResponse body = OtpLoginResponse(data: '', phone: '', otp: '');
  //Sending OTP
  void sendOtp({
    required BuildContext context,
    required String phone,
  }) async {
    try {
      Pattern pattern = r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
      RegExp regex = RegExp(pattern.toString());
      if (regex.hasMatch(phone)) {
        showSnackBar(context, "Please enter a valid Phone Number");
        return;
      }

      body.phone = phone;

      http.Response res = await http.post(Uri.parse("$uri/api/otpLogin"),
          body: body.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "OTP HAS BEEN SENT");
        },
      );
      body.data = res.body.substring(1, res.body.length - 1);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //Veriftying OTP
  void verifyOtp({
    required BuildContext context,
    required String otp,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      //
      body.otp = otp;
      http.Response res = await http.post(Uri.parse("$uri/api/otpVerify"),
          body: body.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
            'x-auth-token': token!
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "SUCCESS");
          Navigator.pushReplacementNamed(context, CongratsPage.routeName,
              arguments: 'Your Profile is now ready to use!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
