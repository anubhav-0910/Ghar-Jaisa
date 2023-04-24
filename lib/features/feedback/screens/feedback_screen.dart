// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/custom_button.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FeedBackScreen extends StatelessWidget {
  static const routeName = '/send-feedback';
  const FeedBackScreen({super.key});

  void sendMail(String body) async {
    final Email email = Email(
      body: body,
      subject: 'FEEDBACK-Reg',
      recipients: ['food-delivery-subsystem@hotmail.com'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _feedbackController = TextEditingController();
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
          child: Text(
            "Send Feedback",
            style: TextStyle(
                color: Color.fromARGB(200, 50, 53, 51),
                fontWeight: FontWeight.w600,
                fontSize: 19),
          ),
        ),
        toolbarHeight: 55,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              cursorHeight: 25,
              decoration: InputDecoration(
                labelText: "Enter Feedback",
              ),
              controller: _feedbackController,
              keyboardType: TextInputType.multiline,
              cursorColor: Colors.orange,
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
                text: "Submit FeedBack",
                onTap: () {
                  sendMail(_feedbackController.text);
                }),
          ],
        ),
      ),
    );
  }
}
