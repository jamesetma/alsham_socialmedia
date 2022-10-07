import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyBold.delete,
                  color: Colors.black,
                ))
          ],
          centerTitle: true,
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
          )),
    );
  }
}
