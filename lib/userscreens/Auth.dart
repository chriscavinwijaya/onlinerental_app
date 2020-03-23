import 'user.dart';
import 'package:firebase_auth/firebase_auth.dart';

    class AuthService{
final FirebaseAuth _auth = FirebaseAuth.instance;

User _userFromFirebaseUser(FirebaseUser user) {
  return user != null ? User(uid: user.uid) : null;
}

Stream<User> get user {
  return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);

}

Future signInAnon() async{
  try {

    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
} catch(e) {
    print(e.toString());
    return null;
}
}

Future signInWithEmailAndPassword(String email, String password) async {
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
    FirebaseUser user = result.user;
    return user;
  } catch (error) {
    print(error.toString());
    return null;
  }
}

// register with email and password
Future registerWithEmailAndPassword(String email, String password) async {
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    // create a new document for the user with the uid

    return _userFromFirebaseUser(user);
  } catch (error) {
    print(error.toString());
    return null;
  }
}

// sign out
Future signOut() async {
  try {
    return await _auth.signOut();
  } catch (error) {
    print(error.toString());
    return null;
  }
}
    }