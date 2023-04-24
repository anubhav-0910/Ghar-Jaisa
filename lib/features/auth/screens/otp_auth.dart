import 'package:flutter/material.dart';
import 'package:project_s4/features/auth/services/auth_service.dart';
import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';

class VerificationCodePage extends StatefulWidget {
  static const routeName = '/otp-auth';

  const VerificationCodePage({super.key, required this.phoneN});
  final String phoneN;
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  //Variables
  final phoneController = TextEditingController();
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final double _boxSize = 50;
  String _code = '';
  AuthService authService = AuthService();

  void sendOtp(BuildContext context, String phone) {
    authService.sendOtp(context: context, phone: phone);
  }

  void verifyOtp(BuildContext context, String otp) {
    authService.verifyOtp(context: context, otp: otp);
  }

  //Dispose method
  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildCodeBox(int index) {
    return Container(
      width: _boxSize,
      height: _boxSize,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            _code = _code + value;
            if (index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              // all boxes filled, do something with the code
            }
          } else if (value.isEmpty && _code.isNotEmpty) {
            _code = _code.substring(0, _code.length - 1);
            if (index > 0) {
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
        ),
        toolbarHeight: 55,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 50),

            const SizedBox(height: 10),
            const Text(
              'Enter the 4-digit verification code',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Code will be sent to phone number on clicking the button. \nThis code will be expired in 5 minute',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildCodeBox(index)),
            ),
            const SizedBox(height: 30),
            // TextFormField(
            //   maxLength: 10,
            //   controller: phoneController,
            // ),

            Container(
              alignment: Alignment.centerRight,
              child: ArgonTimerButton(
                animationDuration: const Duration(microseconds: 0),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.30,
                minWidth: MediaQuery.of(context).size.width * 0.20,
                color: const Color(0xFF7866FE),
                borderRadius: 5.0,
                child: const Text(
                  "SEND OTP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                loader: (timeLeft) {
                  return Text(
                    "Resend OTP in - ${timeLeft}s",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  );
                },
                onTap: (startTimer, btnState) {
                  if (btnState == ButtonState.Idle) {
                    startTimer(80);
                    sendOtp(context, widget.phoneN);
                  }
                },
              ),
            ),

            // ElevatedButton(
            //   onPressed: () => sendOtp(context, widget.phoneN),
            //   child: const Text("SEND OTP"),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: () {
          // validate the code or send it to the server for validation
          verifyOtp(context, _code);
        },
        label: const Text('VerifY OTP'),
      ),
    );
  }
}
