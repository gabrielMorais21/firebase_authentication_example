import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_example/firebase_options.dart';
import 'package:firebase_authentication_example/home.dart';
import 'package:firebase_authentication_example/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
    );
  }
}
