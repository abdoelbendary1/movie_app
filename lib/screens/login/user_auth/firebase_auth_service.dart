import 'package:firebase_auth/firebase_auth.dart';

class FirbaseAuthServices {
  FirebaseAuth _db = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential newUser = await _db.createUserWithEmailAndPassword(
          email: email, password: password);
      return newUser.user;
    } catch (e) {
      print("error occured");
    }
    return null;
  }
  Future<User?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential newUser = await _db.signInWithEmailAndPassword(
          email: email, password: password);
      return newUser.user;
    } catch (e) {
      print("error occured");
    }
    return null;
  }
}
