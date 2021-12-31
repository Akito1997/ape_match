import 'package:ape_match/models/user_model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataDao {
  Future updateUserToFirestore(UserData data, String uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update(data.toJson());
  }

  Future setUserToFirestore(UserData data, String uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(data.toJson());
  }

  Future updateUserGenderToFirestore(String uid, String gender) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update({"gender": gender});
  }
}
