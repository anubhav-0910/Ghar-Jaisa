import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = 'ResetPassword';
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
          child: Text(
            'Notifications',
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
      body: ListView.builder(
        itemCount: 5, // replace with actual notification count
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {},
            key: Key(""),
            background: Container(
              alignment: AlignmentDirectional.centerEnd,

              // background color when swiping to delete
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.delete,
                  color: Colors.orange,
                ),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(5),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(70)),
              child: Card(
                elevation: 0,
                child: ListTile(
                  title: Text(
                    'Notification Title $index', // replace with actual notification title
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Notification Message $index', // replace with actual notification message
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Text(
                    '3d ago', // replace with actual timestamp
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  onTap: () {
                    // TODO: Implement notification tap logic
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
