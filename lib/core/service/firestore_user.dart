import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection("User");

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot<Object?>> getCurrentUser(String uid) async {
    return await _userCollectionReference.doc(uid).get();
  }
}
