import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/nav_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screens.dart';
import 'themes/themes_data.dart';
import 'screens/admin_screens/admin_nav_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBF6DDWPHgyFcktq2GJ9yt9x2uJE16rhpI",
    appId: "1:315027320358:android:b77fb191d0e77ad19ec0e7",
    messagingSenderId: "315027320358",
    projectId: "soccs-vote",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginScreen(),
        '/nav': (context) => NavScreen(),
        '/adnav': (context) => AdminNavScreen(),
      },
    );
  }
}
