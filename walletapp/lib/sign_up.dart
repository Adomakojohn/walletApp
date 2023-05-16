// ignore_for_file: avoid_print, empty_statements

import 'package:demo/home.dart';
import 'package:demo/reuserble_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    
  final TextEditingController _passwordTextController = TextEditingController( );
  final TextEditingController _emailTextController = TextEditingController( );
   
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
       Container(  
        
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
               Colors.lightGreen,
             Colors.lightBlue,
           ]
          ),
        ),
         
        child:  Column( mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             const Center(
              child: Padding(
                padding: EdgeInsets.all(21),
                child: TextField(
                  decoration:  InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                    ),
                  ),
                ),
              ),
              
            ),
             Center(
              child: Padding(
                padding: const EdgeInsets.all(21),
                child: TextField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                    ),
                  ),
                ),
              ),
            ),
             Center(
               child: Padding(
                padding: const EdgeInsets.all(21),
                child: TextField(
                  controller: _passwordTextController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.white54,
                    hintText: 'Create Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
            ),
             signInsignUpButton(context, false, () async {
             
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
                  
                 
                 
             })
             
          ],
        ),
        
        ),
           );
      
    
  }
}