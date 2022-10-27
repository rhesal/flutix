part of 'services.dart';

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');

  static Future<void> updateUser(UserModel userModel) async {
    _userCollection.doc(userModel.id).set({
      'email': userModel.email,
      'name': userModel.name,
      'balance': userModel.balance,
      'selectedGenres': userModel.selectedGenres,
      'selectedLanguange': userModel.selectedLanguage,
      'profilePicture': userModel.profilePicture ?? ""
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
  }
}
