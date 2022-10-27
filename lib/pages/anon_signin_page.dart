part of 'pages.dart';

class AnonSignInPage extends StatelessWidget {
  const AnonSignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SIGN IN ANONYMOUSLY',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              StreamBuilder<User>(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('SIGNED IN: ${snapshot.data.uid}');
                    } else {
                      return const Text("You haven't signed in yet");
                    }
                  }),
              const SizedBox(height: 15),
              SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.lightBlue.shade900)),
                      onPressed: () {
                        if (FirebaseAuth.instance.currentUser != null) {
                          FirebaseAuth.instance.signOut();
                        } else {
                          FirebaseAuth.instance.signInAnonymously();
                        }
                      },
                      child: StreamBuilder<User>(
                        stream: FirebaseAuth.instance.userChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return const Text("Sign Out");
                          } else {
                            return const Text("Sign In");
                          }
                        },
                      )))
            ],
          ),
        ));
  }
}
