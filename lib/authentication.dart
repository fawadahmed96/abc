import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class AuthImplementation {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<String> getCurrentUser();


  Future<void> signOut();


  Future<void> sendEmailVerification();

  Future<bool> isEmailVerified();

}

class Auth implements AuthImplementation {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user.uid;
  }
  Future<String> signUp(String email, String password) async {
    UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user.uid;
  }

  Future<String> getCurrentUser() async {
    User user = _firebaseAuth.currentUser;
    print("fawads $user");
    return user != null ? user.uid : null;
  }

  Future<void> sendEmailVerification() async {
    final user = _firebaseAuth.currentUser;
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    final user = _firebaseAuth.currentUser;
    return user.emailVerified == null ? false : user.emailVerified;
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
