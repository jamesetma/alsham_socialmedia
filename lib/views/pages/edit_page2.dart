import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:flutter/material.dart';

class EditPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: Paddings.sidePadding,
          child: Column(
            children: [
              Row(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      radius: 55,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 85),
                        child: Padding(
                            padding: EdgeInsets.only(left: 75, top: 3),
                            child: Icon(Icons.camera_alt))),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Seveen Shaheen',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250, top: 10),
                child: Text(
                  'Username',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 270),
                child: Text(
                  'Relgion',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              Builder(builder: (context) {
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone number',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ],
                    ),
                    SizedBox(width: 70),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gender'),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ],
                    )
                  ],
                );
              }),
              Text('About'),
              TextField(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextButton(onPressed: () {}, child: Text('Update')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
