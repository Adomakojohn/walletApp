// ignore_for_file: avoid_print, empty_statements

import 'package:demo/home.dart';
import 'package:demo/reuserble_widgets.dart';
import 'package:demo/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   final TextEditingController _passwordTextController = TextEditingController( );
  final TextEditingController _emailTextController = TextEditingController( );
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
       body:
       Container(  
         decoration: const BoxDecoration(
           gradient:  LinearGradient( begin: Alignment.topCenter,
           end: Alignment.bottomLeft,
           colors: [
             Colors.lightGreen,
             Colors.lightBlue,
           ]
           ),
         ),
         child: Column( mainAxisAlignment: MainAxisAlignment.center,
         
          children: [
             Padding(
              padding: const EdgeInsets.all(21),
              child: TextField(
                controller: _emailTextController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_3_outlined),
                  filled: true,
                  fillColor: Colors.white54,
                  hintText: 'Email or Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33)),
                  )
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(21),
               child: TextField( 
                controller: _passwordTextController,
                 decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)),
                    )
                  ),
                  obscureText: true,
               ),
             ),
             const SizedBox(
              height: 20,
             ),
              signInsignUpButton(context, true, () async{
                 try  {
                 await  FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _emailTextController.text,
                 password: _passwordTextController.text
                 ).then((value) {
                  print("Created new account ");
                   Navigator.push(
                    context,
                     MaterialPageRoute(
                      builder: 
                      (context)=> const HomePage()));
                 }
                 );
                 } catch (e) {
                   print('Error occured $e');
                 };
              }),
              
             const  SizedBox(
              height: 20,
             ),
             ElevatedButton( style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 22, 187, 137),
           ),
              onPressed: () {
                Navigator.push(context,  MaterialPageRoute(builder: (context)=> const SignUp()));
             }, child: const Text("Sign Up"))
          ],
            )
          
         ),
       );
       
     


  }
}