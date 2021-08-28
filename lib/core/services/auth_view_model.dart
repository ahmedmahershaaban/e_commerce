import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
}
