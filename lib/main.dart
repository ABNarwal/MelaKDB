import 'package:firebase_core/firebase_core.dart';
//import 'package:http/http.dart';
import 'package:flutter/material.dart';
//import 'package:mgmt/pages/Display.dart';
//import 'package:mgmt/pages/ShowListPage.dart';
//import 'package:mgmt/pages/details.dart';

//import 'package:mgmt/pages/login.dart';
//import 'package:mgmt/pages/SearchByCategory.dart';
//import 'package:mgmt/pages/shopalloc.dart';
import 'package:mgmt/pages/home.dart';
//import 'package:mgmt/pages/profile.dart';
//import 'package:mgmt/provider/google_sign_in.dart';
//import 'package:provider/provider.dart';
//import 'package:http/http.dart' as http;

const primaryColor = Color(0xFF4a4e69);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Allocation',
      theme: ThemeData(
          primaryColor: primaryColor,
          //primarySwatch: Colors.blue,

          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 24.0, color: Colors.white),
            bodyText1: TextStyle(fontSize: 18),
            bodyText2: TextStyle(fontSize: 18),
            subtitle1: TextStyle(color: Colors.white, fontSize: 18),
            subtitle2: TextStyle(fontSize: 18),
          ),
          iconTheme: IconThemeData(color: Colors.white, size: 26),
          cardTheme: CardTheme(
              elevation: 30,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Color(0xFF4a4e69)),
          dividerColor: Colors.white,
          listTileTheme: ListTileThemeData(
            iconColor: Colors.white,
            textColor: Colors.white,
          ),
          buttonTheme: ButtonThemeData(
              buttonColor: Color.fromARGB(255, 133, 139, 185),
              hoverColor: Colors.white70),
          drawerTheme: DrawerThemeData(
            backgroundColor: Color(0xFF4a4e69),
          )),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
