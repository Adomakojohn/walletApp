
import 'package:demo/sign_in.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body:    Container(  
        
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
               Colors.grey,
             Colors.blueGrey,
           ]
          ),
        ),
         child: Center(
           child: ElevatedButton( style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
           ),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignIn()));
           }, child: const Text("Log Out") 
           ),
         ),
       
           ),
      
    );
  }
}