import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vs_email_verification_firebase/screens/homepage.dart';
import 'package:flutter_vs_email_verification_firebase/screens/login.dart';
import 'package:flutter_vs_email_verification_firebase/screens/verifyemail.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context, snapshot){
        if(snapshot.hasData){
          print(snapshot.data);
          if(snapshot.data!.emailVerified){
            return HomePage();
          } else{
            return Verify();
          }          

        } else{
          return  Login();
        }
      }
      ),
    );
  }
}
