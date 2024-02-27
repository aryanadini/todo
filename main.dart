import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/home.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBq_7fmoiW9r0W06g04Hh03C6wMVVdPC_s",
      appId: "1:253216764928:android:f29d9c74425803953bd4e5",
      messagingSenderId: "253216764928",
      projectId: "mytodo-bcf3c",
    ),
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:Home1() ,
    );
  }
}
