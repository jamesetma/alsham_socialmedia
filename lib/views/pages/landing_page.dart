import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(label: 'Add', icon: Icon(Icons.add)),
        BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person))
      ]),
    );
  }
}
