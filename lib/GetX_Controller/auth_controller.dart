import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/login/login_page.dart';

class FirebaseAuthSignUp extends GetxController {
  final auth = FirebaseAuth.instance;

  // 유저를 저장해야됨..

  Future<String> singup(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('비밀번호의 보안이 약합니다.');
        return 'ss';
      } else if (e.code == 'email-already-in-use') {
        print('이미 가입된 아이디가 있습니다');
        return 'already';
      }
    } catch (e) {
      print('실패');
      return '실패';
    }

    return '성공';
  }

  // 로그인 기능은 되는데 , login_page 에서 2번을 눌러야 페이지 이동이 됨 ,
  // home 에서 로그아웃을 누르면 uid 안없어짐
  Future<void> signin(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('현재 가입된 이메일이 없습니다.');
      } else if (e.code == 'wrong-password') {
        print('비밀번호가 잘못 되었습니다.');
      }
    }
  }
}
