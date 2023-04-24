import 'package:flutter/material.dart';
import 'package:project_s4/features/auth/screens/login_screen.dart';
import 'package:project_s4/features/auth/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/auth-signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final _signUpFormKey = GlobalKey<FormState>();

  //Dispose Method to avoid memory leaks
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              const Text(
                "Signup to your account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Form(
                key: _signUpFormKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //
                      //*****USERNAME TEXTFORM FIELD
                      //
                      child: TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter your username';
                          }
                          return null;
                        },
                        controller: _nameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Username ",
                          icon: Icon(Icons.email, color: Colors.orange),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //
                      //*****EMAIL TEXTFORM FIELD
                      //
                      child: TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter your Email';
                          }
                          return null;
                        },
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email ",
                          icon: Icon(Icons.email, color: Colors.orange),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //
                      //*****PASSWORD TEXTFORM FIELD
                      child: TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          icon: Icon(Icons.lock, color: Colors.orange),
                          //suffixIcon: Icon(Icons.visibility, color: Colors.orange),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //
                    // *****SIGNUP BUTTON
                    //
                    ElevatedButton(
                      onPressed: () {
                        if (_signUpFormKey.currentState!.validate()) {
                          signUpUser();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Signup",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushReplacementNamed(
                    //         context, LoginScreen.routeName);
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.orange,
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 80, vertical: 12),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    //   child: const Text("LOGIN", style: TextStyle(fontSize: 20)),
                    // ),
                    const SizedBox(height: 50),
                    //
                    //SIGNUP SCREEN
                    //
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("already have and account ?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          child: const Text("Login")),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
