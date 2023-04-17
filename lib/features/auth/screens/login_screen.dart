import 'package:flutter/material.dart';
import 'package:project_s4/features/auth/screens/signup_screen.dart';

import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/auth-login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final _signInFormKey = GlobalKey<FormState>();

  //Dispose Method to avoid memory leaks
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  //Design Of AuthScreen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login to your account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Form(
              key: _signInFormKey,
              child: Column(
                children: [
                  //
                  // EMAIL FORM FIELD
                  //
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
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
                  //
                  // PASSWORD FORMFIELD
                  //
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock, color: Colors.orange),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                  const SizedBox(height: 20),
                  //
                  //LOGIN BUTTON
                  //
                  ElevatedButton(
                    onPressed: () {
                      if (_signInFormKey.currentState!.validate()) {
                        signInUser();
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
                    child: const Text("Login", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Or",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("SignUp", style: TextStyle(fontSize: 20)),
            ),
            // SignInButton(
            //   Buttons.Google,
            //   onPressed: () {},
            //   text: "Continue with Google",
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
