import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_rest/home.dart';
import 'package:google_sign_in_rest/login.dart';

class AuthService {
  // 1 handleAuthState()
  // 2 signIn With GoggleAuthState()
  // 3 SignOut()

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginPage();
          }
        });
  }

  SignInWithGoggle() async {
    //Trigger the authentication flow
   try{
     final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>[
       'email',
       'https://www.googleapis.com/auth/contacts.readonly',
     ]).signIn();

     //Obtain the auth detlais from the requesr
     final GoogleSignInAuthentication googleAuth =
     await googleUser!.authentication;

     //create a new credential
     final credential = GoogleAuthProvider.credential(
         accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
     await FirebaseAuth.instance.signInWithCredential(credential);
   }catch(e){
     print("eeeeeeeeeeeeeeeeee${e.toString()}");

   }
  }

  SignOut() {
    FirebaseAuth.instance.signOut();
  }
}
