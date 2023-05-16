
import 'package:demo/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async { 
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
   runApp( const WalletApp());

}


class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'wallet',
      home: SignIn(),
    );
  }
}

