import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/getx_controller.dart';
import 'package:shong_app/Page/home/home_page.dart';
import 'package:shong_app/Page/login/login_page.dart';
import 'package:shong_app/Page/second/second_page.dart';
import 'package:shong_app/Page/third/third_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

final double width = Get.width;
final double height = Get.height;

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List page = [HomePage(), SecondPage(), ThirdPage()];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text('숑앱', style: TextStyle(color: Colors.black54)),
          actions: [
            Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },
                  child: Text('로그인하기', style: TextStyle(color: Colors.black54)),
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
