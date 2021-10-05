import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthSignUp extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  // RxString user = "".obs;

  Future<String?> singup(email, password) async {
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
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        print('이미 가입된 아이디가 있습니다');
        return 'already-in-use';
      } else if (e.code == 'invalid-email') {
        print('이메일 주소가 유효하지 않습니다.');
        return 'invalid-email';
      } else if (e.code == 'operation-not-allowed') {
        print('이메일/비밀번호 계정을 입력해주세요');
        return 'operation-not-allowed';
      }
    } catch (e) {
      print('회원가입 실패 알수없는 오류');
      return '회원가입실패';
    }
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
        print('비밀번호가 잘못되었습니다.');
        return 'wrong-password';
      } else if (e.code == 'user-disabled') {
        print('정지된 이메일 입니다.');
        return 'user-disabled';
      } else if (e.code == 'invalid-email') {
        print('이메일 주소가 유효하지 않습니다');
        return 'invalid-email';
      }
    }
    return '';
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    // user = "".obs;
  }
}
