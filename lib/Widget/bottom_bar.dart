import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        child: Row(
          children: [
            Container(
              child: Column(
                children: [
                  Icon(Icons.home),
                  Text('홈'),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Icon(Icons.speaker_notes),
                  Text('자유게시판'),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Icon(Icons.person),
                  Text('홈'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
