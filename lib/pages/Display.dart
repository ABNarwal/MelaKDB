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
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );

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
