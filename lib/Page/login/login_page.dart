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

void currentUserFn() {
  if (currentUser != null) {
    Get.off(() => Home());
    print(currentUser!.uid);
  } else {
    print('로그인이 안되어있습니다.');
  }
}

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
                setState(() {
                  loginPassword = text;
                });
              },
              decoration: InputDecoration(
                hintText: 'PASSWORD',
                contentPadding: EdgeInsets.only(left: 5),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // _controller.signin(loginId, loginPassword);

              _controller.signin(loginId, loginPassword).then((value) {
                if (value == 'not-found') {
                  // 가입된 아이디를 찾을 수 없습니다.
                } else if (value == 'wrong-password') {
                  // 비밀번호가 잘못 되었습니다.
                } else if (value == '성공') {
                  // Home으로 돌아가기
                  currentUserFn();
                }
              });
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
                  id = '${text}@naver.com';
                });
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
              onChanged: (text) {
                setState(() {
                  password = text;
                });
              },
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
            onPressed: () async {
              _controller.singup(id, password).then((result) {
                if (result == 'already') {
                  return showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('AlertDialog'),
                      content: const Text('이미가입'),
                    ),
                  );
                } else if (result == 'ss') {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('AlertDialog'),
                      content: const Text('비밀번호 보안 약함'),
                    ),
                  );
                } else if (result == '성공') {
                  print('$id $password');
                  // id , password 를 user에 저장할거임
                  // 그리고 @naver.com (이메일을 붙였을때 validation 설정 해야댐)
                  Get.off(() => Home());
                }
              });
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
