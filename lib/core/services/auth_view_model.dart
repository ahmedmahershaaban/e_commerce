import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final OAuthCredential googleSignInCredential =
        GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication!.idToken,
            accessToken: googleSignInAuthentication.accessToken);

    await _firebaseAuth.signInWithCredential(googleSignInCredential);
  }

  void facebookLoginInMethod() async {
    final LoginResult loginResult = await _facebookAuth
        .login(); // by default we request the email and the public profile
    if (loginResult.status == LoginStatus.success) {
      final AccessToken? accessToken = loginResult.accessToken;
      final facebookCredential =
          FacebookAuthProvider.credential(accessToken!.token);
      await _firebaseAuth.signInWithCredential(facebookCredential);
    }
  }
}
