import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/auth_controller.dart';
import 'package:shong_app/Page/home/home_page.dart';
import 'package:shong_app/Page/login/login_page.dart';
import 'package:shong_app/Page/second/second_page.dart';
import 'package:shong_app/Page/user_page/user_page.dart';

// 로그인 , 회원가입 했을 때 렌더 되었을 때 , currentUser 적용이 안됨 ,
// 그래서 로그인하기 , 로그아웃하기 버튼이 안바뀜 ,
// auth_controller에서 user을 받아 Obx 처리 해야될듯?
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
    FirebaseAuthSignUp _controller = Get.put(FirebaseAuthSignUp());
    final List page = [HomePage(), SecondPage(), ThirdPage()];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          elevation: 0.5,
          title: Text('숑앱', style: TextStyle(color: Colors.black54)),
          centerTitle: true,
          actions: [
            Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_controller.currentUser != null) {
                      Get.put(FirebaseAuthSignUp()).signOut();
                    } else if (_controller.currentUser == null) {
                      Get.to(() => LoginPage());
                    }
                  },
                  child: Text(
                      _controller.currentUser != null ? '로그아웃' : '로그인하기',
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
