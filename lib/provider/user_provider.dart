import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/view_models/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider =
    StateProvider<UserData>((ref) => UserViewModel.defaultUserData);
final genderProvider = StateProvider<String>((ref) => "男");
final userNameProvider = StateProvider<String>((ref) => "");
