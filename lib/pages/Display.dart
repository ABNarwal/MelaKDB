import 'package:flutter/material.dart';
import 'searchCard.dart';

class TimelineCard {
  String title;
  String description;
  IconData icon;

  TimelineCard(this.title, this.description, this.icon);
}

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Color(0xff4a4e69),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: mySearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

class mySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'food',
    'NZCC',
    'education',
    'cosmetics',
    'jewellery',
    'handicrafts',
    'handloom'
  ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null), //close searchbar
        icon: Icon(Icons.arrow_back),
      );
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear),
        ),
      ];

  @override
  // Widget buildResults(BuildContext context) => Center(
  //       child: Text(
  //         query,
  //         style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
  //       ),
  //     );
  Widget buildResults(BuildContext context) => ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Color.fromARGB(31, 41, 185, 241),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Shop Name:" + "",
                    //     style:
                    //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ListTile(
                      leading: Text("Shop No :"),
                      title: Text((index + 1).toString()),
                      dense: true,
                    ),
                    // Text("Shop Category:" + query,
                    //     style:
                    //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ListTile(
                      leading: Text("Shop Category :"),
                      title: Text(query),
                      dense: true,
                    ),
                    // Row(
                    //   children: [
                    //     Text("How to Reach:",
                    //         style: TextStyle(
                    //             fontSize: 16, fontWeight: FontWeight.bold)),
                    //     Icon(Icons.location_on),
                    //   ],
                    // ),
                    ListTile(
                      leading: Text("How to Reach :"),
                      title: Icon(Icons.location_on),
                      dense: true,
                    ),
                    // Text("Contact No:" + "",
                    //     style:
                    //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ListTile(
                      leading: Text("Contact Us :"),
                      title: Icon(Icons.whatsapp_outlined),
                      dense: true,
                    ),
                    ListTile(
                      leading: Text("Email Us :"),
                      title: Text(""),
                      dense: true,
                    ),
                    ListTile(
                      leading: Text("Address :"),
                      title: Text(""),
                      dense: true,
                    ),
                    ListTile(
                      leading: Text("View Photo"),
                      title: Icon(Icons.camera_alt_outlined),
                      dense: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      });

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }
}
