import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
      return '성공';
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
    return '';
  }

  Future<String> signin(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return '성공';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('현재 가입된 이메일이 없습니다.');
        return 'not-found';
      } else if (e.code == 'wrong-password') {
        print('비밀번호가 잘못 되었습니다.');
        return 'wrong-password';
      }
    }
    return '';
  }
}
