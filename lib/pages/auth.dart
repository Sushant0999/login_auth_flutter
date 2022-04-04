import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  final FirebaseAuth _firebaseAuth;

  Auth(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: 'Failed With Error Code: ${error.code}');
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  Future<void> signOff() async {
    await _firebaseAuth.signOut();
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: 'Failed With Error Code: ${error.code}');
      Fluttertoast.showToast(msg: error.toString());
    }
  }
}
