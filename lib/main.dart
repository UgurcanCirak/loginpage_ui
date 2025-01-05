import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD72Lp8nuOOlswb18WugNMAQ0nVgm3rwv0",
      appId: "1:413517368131:android:28ccce13cb14d10c51fdf6",
      messagingSenderId: "413517368131",
      projectId: "koykasabi-d2766",
      storageBucket: "koykasabi-d2766.firebasestorage.app",
    ),
  );
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kasapp Shop Login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginScreen(),
    );
  }
}
