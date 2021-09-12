import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class FirebaseAuthSignUp extends GetxController {
  final auth = FirebaseAuth.instance;

  Future<void> singup(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('비밀번호의 보안이 약합니다.');
      } else if (e.code == 'email-already-in-use') {
        print('이미 가입된 아이디가 있습니다');
      }
    } catch (e) {
      print(e);
    }
  }
}
