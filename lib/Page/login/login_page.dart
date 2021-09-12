import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/auth_controller.dart';
import 'package:shong_app/GetX_Controller/getx_controller.dart';
import 'package:shong_app/Page/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _isLoginForm = true;
String id = '';
String password = '';

class _LoginPageState extends State<LoginPage> {
  FirebaseAuthSignUp _controller = Get.put(FirebaseAuthSignUp());
  @override
  Widget build(BuildContext context) {
    final double width = Get.width;
    final double height = Get.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.5,
          centerTitle: true,
          title: Text('숑앱', style: TextStyle(color: Colors.black54)),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              width: width * 0.8,
              height: height * 0.6,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.circular(15)),
              child: _isLoginForm ? LoginForm() : SignUpForm(),
            ),
          ),
        ),
      )),
    );
  }

  Widget LoginForm() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('로그인'),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              onChanged: (text) {},
              decoration: InputDecoration(
                hintText: 'ID',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              onChanged: (text) {},
              decoration: InputDecoration(
                hintText: 'PASSWORD',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('로그인하기'),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('회원가입 하시겠습니까?'),
                  margin: EdgeInsets.only(right: 15),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isLoginForm = !_isLoginForm;
                    });
                  },
                  child: Text(
                    '회원가입하기',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget SignUpForm() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('회원가입'),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  id = text;
                });
              },
              decoration: InputDecoration(
                hintText: '이메일로 입력해주세요',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  password = text;
                });
              },
              decoration: InputDecoration(
                hintText: '비밀번호',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              onChanged: (text) {},
              decoration: InputDecoration(
                hintText: '닉네임',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              _controller.singup(id, password);
            },
            child: Text('회원가입완료'),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('로그인 하시겠습니까?'),
                  margin: EdgeInsets.only(right: 15),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isLoginForm = !_isLoginForm;
                    });
                  },
                  child: Text(
                    '로그인하기',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
