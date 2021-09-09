import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/home.dart';

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

/* 
BottomNavigationBar(
      fixedColor: Colors.black,
      backgroundColor: Colors.red[50],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          print(_currentIndex);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.speaker_notes),
          label: '자유게시판',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '프로필',
        )
      ],
    );
*/
