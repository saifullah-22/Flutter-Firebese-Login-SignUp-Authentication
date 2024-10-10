import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vs_email_verification_firebase/wrapper.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  
  signUp() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(const Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
                height: 40,
              ),
        
      
            TextFormField(
              controller: password,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    hintText: "Password",
                    labelText: "Password",
      
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
      
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
      
                      )
                    )
                  ),
                  
                  
                ),
      
                const SizedBox(
                height: 40,
              ),
      
      
            ElevatedButton(
              onPressed: (){
                signUp();
              }, 
              child: const Text("Sign Up",
              style: TextStyle(
              fontSize: 22,
            ),))
          ],
        ),
      ),
    );

  }
}