import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/home/home_page.dart';
import 'package:shong_app/Page/login/login_page.dart';
import 'package:shong_app/Page/second/second_page.dart';
import 'package:shong_app/Page/user_page/user_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

final double width = Get.width;
final double height = Get.height;

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final List page = [HomePage(), SecondPage(), ThirdPage()];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text('숑앱', style: TextStyle(color: Colors.black54)),
          centerTitle: true,
          actions: [
            Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    if (currentUser != null) {
                      await FirebaseAuth.instance.signOut();
                      setState(() {
                        currentUser = null;
                      });
                      print('로그아웃');
                    } else if (currentUser == null) {
                      Get.to(() => LoginPage());
                    }
                  },
                  child: Text(currentUser != null ? '로그아웃' : '로그인하기',
                      style: TextStyle(color: Colors.black54)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink[50]),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          backgroundColor: Colors.red[50],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
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
        ),
        drawer: Drawer(
          child: Text('hello'),
        ),
        body: page[_currentIndex],
      ),
    );
  }
}

Widget postingButton() {
  return Container(
    child: Text('게시물 작성하기'),
    color: Colors.red,
  );
}
