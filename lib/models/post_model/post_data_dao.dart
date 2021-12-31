import 'package:ape_match/models/post_model/post_data.dart';
import 'package:ape_match/models/user_model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostDataDao {
  Future postToFirestore(PostData data) async {
    await FirebaseFirestore.instance.collection("post").add(data.toJson());
  }

  Future<List<PostData>> postDataFromUidToUserData(
      List<PostData> listPostData, String uid) async {
    final listPosts = listPostData.map((postData) async {
      final userData = await _convertFromUidToUserData(postData.uid);
      final data = postData.copyWith(userData: userData);
      return data;
    }).toList();

    final _data = await Future.wait(listPosts);
    return _data;
  }

  Future<UserData> _convertFromUidToUserData(String uid) async {
    final _data =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    final userData = UserData.fromJson(_data.data()!);
    return userData;
  }
}
