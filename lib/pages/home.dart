import 'package:countup/countup.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:mgmt/pages/login.dart';
import 'package:mgmt/pages/profile.dart';
import 'package:mgmt/pages/SearchByCategory.dart';
import 'package:mgmt/pages/shopalloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mgmt/pages/raiseIssue.dart';
import 'package:mgmt/pages/details.dart';
import 'package:mgmt/pages/progress.dart';
import 'package:mgmt/pages/gallery.dart';

import 'ShopCat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Color(0xFF4a4e69),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4a4e69),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF4a4e69)),
                accountName: Text(
                  "Amrutanshu Tyagi",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("amrutanshutyagi@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Color(0xFF4a4e69)),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' Profile '),
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
                Navigator.pop(context);
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
              leading: const Icon(Icons.search),
              title: const Text(' Search By Category'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchByCategory(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text(' Share app '),
              onTap: () {
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
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  //crossAxisSpacing: 5,
                  //mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                                        ShopCat(Cat: 'Saras'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                                    builder: ((context) =>
                                        ShopCat(Cat: 'Furniture'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                                    builder: ((context) =>
                                        ShopCat(Cat: 'Cosmetics'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
                      child: Column(children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                          "Book Shops",
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
                                        ShopCat(Cat: 'Education'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                                    builder: ((context) =>
                                        ShopCat(Cat: ' Jewellery'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                                    builder: ((context) =>
                                        ShopCat(Cat: 'Handicrafts'))));
                          },
                        ),
                      ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        //<-- 2. SEE HERE
                        side: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF4a4e69),
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
                                    builder: ((context) =>
                                        ShopCat(Cat: 'Handlooms'))));
                          },
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              // GridView.builder(
              //   shrinkWrap: true,
              //   // padding: const EdgeInsets.symmetric(horizontal: 30),
              //   itemCount: 10,
              //   itemBuilder: (ctx, i) {
              //     return Card(
              //       color: Color(0xFF4a4e69),
              //       child: Container(
              //         height: 100,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(25)),
              //         margin: EdgeInsets.all(5),
              //         padding: EdgeInsets.all(5),
              //         child: Stack(
              //           children: [
              //             Column(
              //               // mainAxisAlignment: MainAxisAlignment.center,
              //               // crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Text(
              //                   'Title',
              //                   style: TextStyle(
              //                     fontSize: 32,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //                 Expanded(
              //                   child: Countup(
              //                     begin: 0,
              //                     end: 60,
              //                     duration: Duration(seconds: 1),
              //                     //separator: ',',
              //                     style: TextStyle(
              //                       fontSize: 26,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio: 1.0,
              //     crossAxisSpacing: 0.0,
              //     mainAxisSpacing: 5,
              //     mainAxisExtent: 100,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100.0,
      child: new ListView.builder(
        itemBuilder: (context, index) {
          return new Card(
              child: new Container(
            width: 80.0,
            child: new Text('Hello'),
            alignment: Alignment.center,
          ));
        },
        scrollDirection: Axis.horizontal,
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
