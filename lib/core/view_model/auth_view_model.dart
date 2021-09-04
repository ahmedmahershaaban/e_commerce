import 'package:e_commerce/core/service/fireStore_user.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/view/screens/complete_profile/complete_profile_screen.dart';
import 'package:e_commerce/view/screens/home/home_screen.dart';
import 'package:e_commerce/view/screens/login_success/login_success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  String? email = "", password = "", name = "";
  bool? remember = false;
  List<String> errors = [];

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final OAuthCredential googleSignInCredential =
        GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication!.idToken,
            accessToken: googleSignInAuthentication.accessToken);

    await _firebaseAuth
        .signInWithCredential(googleSignInCredential)
        .then((user) {
      saveUser(user);
      Get.offAll(HomeScreen());
    });
  }

  void facebookSignInMethod() async {
    final LoginResult loginResult = await _facebookAuth
        .login(); // by default we request the email and the public profile
    if (loginResult.status == LoginStatus.success) {
      final AccessToken? accessToken = loginResult.accessToken;
      final facebookCredential =
          FacebookAuthProvider.credential(accessToken!.token);
      await _firebaseAuth.signInWithCredential(facebookCredential).then((user) {
        saveUser(user);
        Get.offAll(HomeScreen());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        Get.offAll(LoginSuccessScreen());
      });
    } on FirebaseException catch (e) {
      print(e.message);
      Get.snackbar(
        "Error Login account",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
        Get.offAll(CompleteProfileScreen());
      });
    } on FirebaseException catch (e) {
      print(e.message);
      Get.snackbar(
        "Error Login account",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: user.user?.displayName == null ? name : user.user!.displayName,
      pic: "",
    ));
  }
}
