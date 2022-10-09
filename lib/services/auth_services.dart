part of 'services.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return user;
    } catch (e) {
      return null;
    }
  }
}

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
