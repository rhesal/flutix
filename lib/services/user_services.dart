part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');

  static Future<void> updateUser(UserModel userModel) async {
    String genres = "";

    for (var genre in userModel.selectedGenres) {
      genres += genre + ((genre != userModel.selectedGenres.last) ? ',' : '');
    }

    _userCollection.doc(userModel.id).set({
      'email': userModel.email,
      'name': userModel.name,
      'balance': userModel.balance,
      'selectedGenres': userModel.selectedGenres,
      'selectedLanguange': userModel.selectedLanguage,
      'profilePicture': userModel.profilePicture ?? ""
    });
  }
}
