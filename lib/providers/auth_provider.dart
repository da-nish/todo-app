import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoapp/models/user_model.dart';
import 'package:todoapp/services/firestore_database.dart';

class AuthProvider extends ChangeNotifier {
  final googlesignin1 = GoogleSignIn();
  GoogleSignInAccount? _user;
  bool get isLoggedIn => _user != null;
  GoogleSignInAccount? get user => _user;

  Future<UserModel?> googleLogin() async {
    try {
      final googleuser = await googlesignin1.signIn();
      if (googleuser == null) return null;
      _user = googleuser;

      final googleAuth = await googleuser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential data =
          await FirebaseAuth.instance.signInWithCredential(credential);
      UserModel userObject = UserModel(
          name: getData(data.user?.displayName),
          email: getData(data.user?.email),
          accountId: getData(data.user?.uid),
          token: getData(data.credential?.accessToken),
          flow: "default");
      notifyListeners();
      FirestoreDatabase.createInstance(user!.id);

      return userObject;
    } catch (err) {
      return null;
    }
  }

  String getData(String? value) => value ?? "";

  Future googleLogout() async {
    _user = null;
    try {
      await googlesignin1.disconnect();
      FirebaseAuth.instance.signOut();
      notifyListeners();
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
