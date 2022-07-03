import 'dart:ui';
import 'package:mgmt/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:mgmt/pages/home.dart';

class RaiseIssue extends StatefulWidget {
  const RaiseIssue({Key? key}) : super(key: key);

  @override
  State<RaiseIssue> createState() => _RaiseIssueState();
}

class _RaiseIssueState extends State<RaiseIssue> {
  String _issueTypeController = 'Electricity';

  final _formkey = GlobalKey<FormState>();
  final issueEC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final issueTypeField = DropdownButtonFormField<String>(
      value: _issueTypeController,
      items: [
        'Electricity',
        'Tent',
        'Furniture',
        'Water',
        'Theft',
        'Others',
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Issue'),
      onChanged: (value) {
        setState(
          () {
            _issueTypeController = value!;
          },
        );
      },
    );

    final issueField = TextFormField(
      autofocus: false,
      controller: issueEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Issue can't be empty";
        }
      },
      onSaved: (value) {
        issueEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: ".....",
        labelText: "Describe",
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Raise Issue'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "What would you like to raise issue about?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                issueTypeField,
                const SizedBox(
                  height: 40,
                ),
                issueField,
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff4a4e69),
                  ),
                  child: const Text('Send'),
                  onPressed: () async {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
