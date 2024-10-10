import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  TextEditingController email= TextEditingController();
  reset() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
    
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: Padding(  
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    hintText: "Enter Email",
                    prefixIcon: const Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                                    
              
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),

        
            

            ElevatedButton(
              onPressed: (){
                reset();
              }, 
              child: const Text("Send Link",
              style: TextStyle(
              fontSize: 22,
            ),)),

              
          ],
        ),
      ),
    );
  }
}