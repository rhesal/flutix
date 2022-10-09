import 'package:flutix/services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signUp(
                      "rhesal.m@gmail.com",
                      "123456",
                      "rhesal",
                      ["Action", "Sci-Fi", "Comedy", "Drama"],
                      "Bahasa Indonesia");
                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                })
          ],
        )),
      ),
    );
  }
}
