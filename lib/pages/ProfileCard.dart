import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final myController = TextEditingController();
  var result = "";
  var mob = "";
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(
      () {},
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile Card"),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                //height: MediaQuery.of(context).size.height * 0.75,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: myController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                    //border: OutlineInputBorder(),
                    hintText: 'Enter Something ',
                    labelText: "Enter",
                  ),
                  onChanged: (String value) {
                    setState(() {
                      // result = value;
                      mob = value;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, top: 50)),
                  ElevatedButton(
                    //style: ButtonStyle(backgroundColor: Colors.grey,),
                    onPressed: () {
                      setState(() {
                        result = myController.text;
                      });
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        myController.clear();
                        result = "";
                        mob = "";
                      });
                    },
                    child: Text("Clear"),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Card(
                      elevation: 15,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(40)),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 20)),
                              Text(
                                "Name:",
                              ),
                              Text(result),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 20)),
                              Text("Mobile No:"),
                              Text(mob),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 50))
                        ],
                      ),
                    ),
                    Positioned(
                      left: 30,
                      right: 30,
                      top: -50,
                      child: CircleAvatar(
                        radius: 50,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/flower.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 50,
                    //   child: ClipOval(
                    //     child: Image.asset(
                    //       "assets/images/flower.jpg",
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
