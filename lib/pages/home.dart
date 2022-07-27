import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:mgmt/pages/helpCenter.dart';
import 'package:mgmt/pages/login.dart';
import 'package:mgmt/pages/profile.dart';
import 'package:mgmt/pages/SearchByCategory.dart';
import 'package:mgmt/pages/shopalloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mgmt/pages/raiseIssue.dart';
import 'package:mgmt/pages/details.dart';
import 'package:mgmt/pages/progress.dart';
import 'package:mgmt/pages/gallery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ShopCat.dart';
import 'dart:math';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String? user_name;
String? user_email;
var drawerText = TextStyle(color: Colors.blue);
String ShareText =
    "Welcome to Help the Needy App, Install the app for helping the needy from : https://play.google.com/store/apps/details?id=com.help.theneedy";

class _HomePageState extends State<HomePage> {
  List<Color> GridColor = [
    Color.fromARGB(255, 99, 176, 212),
    Color.fromARGB(255, 240, 123, 123),
    Colors.amber,
    Colors.blueGrey,
    Colors.teal,
    Color.fromARGB(255, 200, 147, 209),
    Color.fromARGB(255, 243, 187, 102),
    Color.fromARGB(255, 177, 240, 105),
    Colors.cyan,
    Color.fromARGB(255, 230, 118, 155),
    Color.fromARGB(255, 133, 139, 185),
    Color(0xFFCCDA38),
  ];
  void getNameEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      user_name = prefs.getString("username");
      user_email = prefs.getString("useremail");
    });
  }

  @override
  void initState() {
    getNameEmail();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Color(0xFF4a4e69),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4a4e69),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF4a4e69)),
                accountName: Text(user_name == null ? "" : user_name!),
                accountEmail: Text(user_name == null ? "" : user_email!),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  //backgroundColor: Color(0xFFCCDA38),
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  child: Text(
                    user_name != null
                        ? user_name!.substring(0, 1).toUpperCase()
                        : "",
                    style: TextStyle(fontSize: 30.0, color: Color(0xFF4a4e69)),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ),
            Divider(
              height: 2,
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                ' Profile Details',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text(' Upload Pictures '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Gallery(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bug_report),
              title: const Text(' Raise Issue '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RaiseIssue(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(' Help Center'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Helpline())));

                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.priority_high),
              title: const Text(' Check Progress'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgressPage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.share),
              title: const Text(' Share app '),
              onTap: () {
                Share.share(ShareText);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Last date to register: XX/ XX/ 2022',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Text('Date and Time of Draw : XX/ XX/ 2022 , XX:XX:XX',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: [
                    Card(
                      color: GridColor[0],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Total Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          hoverColor: Colors.white,
                          child: Text(
                            "850",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        ShopCat(Cat: 'Select All'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[1],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.fromLTRB(5, 20, 5, 20)),
                        Text(
                          "Reserved",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("150",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {},
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[2],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "NZCC Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("100",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        ShopCat(Cat: 'NZCC'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[3],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Saras Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("100",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        ShopCat(Cat: 'Saras'.toLowerCase()))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[4],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Food Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("20",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        ShopCat(Cat: 'Food'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[5],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Furniture Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("100",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ShopCat(
                                        Cat: 'Furniture'.toLowerCase()))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[6],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Cosmetic Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("100",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ShopCat(
                                        Cat: 'Cosmetics'.toLowerCase()))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[7],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Education Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("100",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ShopCat(
                                        Cat: 'Education'.toLowerCase()))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[8],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Jewellery Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("100",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ShopCat(
                                        Cat: ' Jewellery'.toLowerCase()))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[9],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Handicraft Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("100",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ShopCat(
                                        Cat: 'Handicrafts'.toLowerCase()))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      color: GridColor[10],
                      // color: Colors
                      //     .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Handloom Shops",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Text("100",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ShopCat(
                                        Cat: 'Handlooms'.toLowerCase()))));
                          },
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildMarquee() {
  return Marquee(
    text: 'GeeksforGeeks.org was created'
        ' with a goal in mind to provide well written,'
        ' well thought and well explained solutions for'
        ' selected questions. The core team of five super geeks constituting'
        ' of technology lovers and computer science enthusiasts'
        ' have been constantly working in this direction ',
  );
}

Widget _buildComplexMarquee() {
  return Marquee(
    text: 'GeeksforGeeks is a one-stop destination for programmers.',
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
    scrollAxis: Axis.horizontal,
    crossAxisAlignment: CrossAxisAlignment.start,
    blankSpace: 20.0,
    velocity: 100.0,
    pauseAfterRound: Duration(seconds: 1),
    showFadingOnlyWhenScrolling: true,
    fadingEdgeStartFraction: 0.1,
    fadingEdgeEndFraction: 0.1,
    numberOfRounds: 3,
    startPadding: 10.0,
    accelerationDuration: Duration(seconds: 1),
    accelerationCurve: Curves.linear,
    decelerationDuration: Duration(milliseconds: 500),
    decelerationCurve: Curves.easeOut,
  );
}
