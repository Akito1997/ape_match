import 'package:ape_match/models/post_model/post_data.dart';
import 'package:ape_match/models/post_model/post_data_dao.dart';
import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewModel {
  final PostDataDao _postDataDao = PostDataDao();
  late WidgetRef _ref;
  PostViewModel(this._ref);
  Future<void> sendMessage(UserData userData, String message) async {
    final _postData = PostData(
      createdAt: Timestamp.now().toDate(),
      message: message,
      uid: userData.uid,
    );

    _postDataDao.postToFirestore(_postData);
  }

  Future<List<PostData>> postDataFromUidandDeleteMute(
      List<PostData> listPost, String uid) async {
    final data = await _postDataDao.postDataFromUidToUserData(listPost, uid);
    final _data = data.where((element) {
      return !_ref.read(userProvider).muteList.contains(element.uid);
    }).toList();

    return _data;
  }
}
