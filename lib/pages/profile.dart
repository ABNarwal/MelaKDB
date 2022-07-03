import 'dart:ui';
import 'package:mgmt/pages/Gallery.dart';
import 'package:mgmt/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:mgmt/pages/home.dart';
import 'package:mgmt/pages/raiseIssue.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/pfp.jpeg"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  // height: 80,
                  child: Card(
                    semanticContainer: false,
                    //clipBehavior:
                    elevation: 10,
                    //shadowColor: Color(0xff1DB954),
                    color: Color(0xff4a4e69),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(),
                              ),
                            ),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // height: 80,
                  child: Card(
                    semanticContainer: false,
                    //clipBehavior:
                    elevation: 10,
                    //shadowColor: Color(0xff1DB954),
                    color: Color(0xff4a4e69),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Settings',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // height: 80,
                  child: Card(
                    semanticContainer: false,
                    //clipBehavior:
                    elevation: 10,
                    //shadowColor: Color(0xff1DB954),
                    color: Color(0xff4a4e69),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const ListTile(
                          leading: Icon(
                            Icons.help,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Help Center',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // height: 80,
                  child: Card(
                    semanticContainer: false,
                    //clipBehavior:
                    elevation: 10,
                    //shadowColor: Color(0xff1DB954),
                    color: Color(0xff4a4e69),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.bug_report,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Raise Issue',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RaiseIssue(),
                              ),
                            ),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // height: 80,
                  child: Card(
                    semanticContainer: false,
                    //clipBehavior:
                    elevation: 10,
                    //shadowColor: Color(0xff1DB954),
                    color: Color(0xff4a4e69),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Upload Pictures',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Gallery(),
                              ),
                            ),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
