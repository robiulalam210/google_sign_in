import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_servies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Home"),),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text("${FirebaseAuth.instance.currentUser!.email}",),
              ElevatedButton(onPressed: () {
                AuthService().SignOut();

              }, child: Text("Goggle Sign Out"))
            ],
          ),
        ),
      ),
    ));
  }
}
