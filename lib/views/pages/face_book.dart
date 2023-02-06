import 'package:flutter/material.dart';

class FaceBook extends StatelessWidget {
  const FaceBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Row(
            children: [
              Icon(
                Icons.messenger,
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.search,
                color: Colors.black,
              ),
              SizedBox(
                width: 245,
              ),
              Text(
                'Facebook',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Icon(Icons.drag_handle),
                SizedBox(width: 50),
                Icon(Icons.notifications_none_rounded),
                SizedBox(width: 50),
                Icon(Icons.flag_outlined),
                SizedBox(
                  width: 50,
                ),
                Icon(Icons.shopping_bag_outlined),
                SizedBox(
                  width: 50,
                ),
                Icon(Icons.shop_2_outlined),
                SizedBox(
                  width: 50,
                ),
                Icon(Icons.home)
              ],
            ),
            SizedBox(
              width: 80,
            ),
            Row(
              children: [
                Icon(Icons.short_text),
                SizedBox(
                  width: 140,
                ),
                Text('modern'),
                SizedBox(
                  width: 50,
                ),
                Text('favourit'),
                SizedBox(
                  width: 50,
                ),
                Text('basicly')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
