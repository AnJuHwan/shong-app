import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/auth_controller.dart';
import 'package:shong_app/Page/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _isLoginForm = true;

String id = '';
String password = '';

String loginId = '';
String loginPassword = '';
var currentUser = FirebaseAuth.instance.currentUser;
FirebaseAuthSignUp _controller = Get.put(FirebaseAuthSignUp());

class _LoginPageState extends State<LoginPage> {
  void signin() {
    _controller.signin(loginId, loginPassword).then((result) {
      if (result == 'not-found') {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('현재 가입된 이메일이 없습니다.'),
            content: const Text('가입된 이메일이 없습니다.'),
          ),
        );
      } else if (result == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('비밀번호가 잘못되었습니다'),
            content: const Text('비밀번호가 잘못되었습니다.'),
          ),
        );
      } else if (result == 'user-disabled') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('정지된 이메일 입니다.'),
            content: const Text('정지된 이메일 입니다.'),
          ),
        );
      } else if (result == 'invalid-email') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(' 이메일 주소가 유효하지 않습니다. '),
            content: const Text(' 이메일 주소가 유효하지 않습니다. '),
          ),
        );
      } else if (result == '성공') {
        print('$id $password');
        Get.off(() => Home());
      }
    });
  }

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
              child: _isLoginForm ? loginForm() : signUpForm(),
            ),
          ),
        ),
      )),
    );
  }

  Widget loginForm() {
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
              onChanged: (text) {
                loginId = text;
              },
              decoration: InputDecoration(
                hintText: 'ID',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              obscureText: true,
              onChanged: (text) {
                loginPassword = text;
              },
              decoration: InputDecoration(
                hintText: 'PASSWORD',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              signin();
            },
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

  Widget signUpForm() {
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
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: '아이디',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              onChanged: (text) {},
              obscureText: true,
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
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: id.length == 0
                  ? MaterialStateProperty.all(Colors.grey[400])
                  : MaterialStateProperty.all(Colors.blue[400]),
            ),
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
