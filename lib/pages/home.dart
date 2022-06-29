import 'package:flutter/material.dart';
import 'package:mgmt/pages/login.dart';
import 'package:mgmt/pages/profile.dart';
import 'package:mgmt/pages/shopalloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Color(0xff4a4e69),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Go to Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
