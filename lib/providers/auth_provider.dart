import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoapp/providers/user_model.dart';
import 'package:todoapp/services/firestore_database.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated,
  registering
}
/*
The UI will depends on the Status to decide which screen/action to be done.

- Uninitialized - Checking user is logged or not, the Splash Screen will be shown
- Authenticated - User is authenticated successfully, Home Page will be shown
- Authenticating - Sign In button just been pressed, progress bar will be shown
- Unauthenticated - User is not authenticated, login page will be shown
- Registering - User just pressed registering, progress bar will be shown

Take note, this is just an idea. You can remove or further add more different
status for your UI or widgets to listen.
 */

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
      // print(":> $googleAuth");

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
      print("login success");
      FirestoreDatabase.createInstance(user!.id);

      return userObject;
    } catch (err) {
      print("err::>> $err");
      return null;
    }
  }

  String getData(String? value) => value ?? "";

  Future googleLogout() async {
    print("doing logout");

    _user = null;
    try {
      await googlesignin1.disconnect();
      FirebaseAuth.instance.signOut();
      print("doing logout");
      notifyListeners();
    } catch (err) {
      print("error :: $err");
    }
  }
}
