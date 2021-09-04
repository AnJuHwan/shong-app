import 'package:flutter/material.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('숑고마켓', style: TextStyle(color: Colors.black54)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        drawer: Drawer(
          child: Text('hello'),
        ),
        body: Container(
          width: 100,
          height: 100,
          child: Text('hello2'),
        ),
      ),
    );
  }
}
