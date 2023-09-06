import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final _auth = FirebaseAuth.instance;


  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }


  Future<void> signOut() async{
    await _auth.signOut();
  }

}