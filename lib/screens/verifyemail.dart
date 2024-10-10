import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vs_email_verification_firebase/wrapper.dart';
import 'package:get/get.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override

  void initState(){
    sendverifylink();
    super.initState();

  }

  sendverifylink() async{
    final user=FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
      Get.snackbar('Link sent', 'A link has been sent to your Email', 
      margin: const EdgeInsets.all(30),
      snackPosition: SnackPosition.TOP
      )},
      );
  }

  reload() async{
    await FirebaseAuth.instance.currentUser!.reload().then((value) =>{
      Get.offAll(Wrapper())
    });
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
      ),
      body: Padding(padding: EdgeInsets.all(28.0),
      child: Center(
        child: Text("Open your email and click on the link provided to verify email & reload this page."),
      ),),

      floatingActionButton: FloatingActionButton(onPressed: (){
        reload();
      },
      child: Icon(Icons.restart_alt_rounded),),
    );
  }
}