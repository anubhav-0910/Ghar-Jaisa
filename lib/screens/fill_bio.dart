// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:project_s4/features/auth/screens/otp_auth.dart';

class FillBio extends StatefulWidget {
  static const routeName = '/fill-bio';
  const FillBio({Key? key}) : super(key: key);

  @override
  FillBioState createState() => FillBioState();
}

class FillBioState extends State<FillBio> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _phone = '';
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: const Color.fromARGB(255, 253, 242, 234),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: Color(0xFFfd841f),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Fill in your bio to get \nstarted',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'This data will be displayed in your account\nprofile for your security',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    height: 2,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: const TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(30),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _firstName = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: const TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(30),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _lastName = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: phoneController,
                      maxLength: 10,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        hintStyle: const TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(30),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Phone Number';
                        }
                        if (value.length <= 9) {
                          return 'Please provide a valid Phone Number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phone = value!;
                      },
                    ),
                    const SizedBox(height: 200.0),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            alignment: Alignment.center,
                            overlayColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 255, 196, 148)),
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xFFfd841f),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Save account details to database or perform other actions here
                              Navigator.pushNamed(
                                  context, VerificationCodePage.routeName,
                                  arguments: phoneController.text);
                            }
                          },
                          child: const Text('Next',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
