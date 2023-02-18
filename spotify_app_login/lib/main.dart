import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_app_login/view/AuthPage.dart';
import 'package:spotify_app_login/view/SignUpPage.dart';
import 'package:spotify_app_login/view/get_started_page.dart';
import 'package:spotify_app_login/view/home_page.dart';
import 'package:spotify_app_login/view/login_page.dart';
import 'package:spotify_app_login/view/root_app.dart';
import 'package:firebase_core/firebase_core.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
            future: Future.delayed(const Duration(seconds:  0)),
              builder: (ctx ,  timer) => timer.connectionState == ConnectionState.done ?
              StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    print(snapshot);
                    if (snapshot.hasData) {
                      return RootApp();
                    } else {
                      return SignUpPage();
                    }
                  }
              ): GetStartPage()
          ) ,


    );

  }
}
