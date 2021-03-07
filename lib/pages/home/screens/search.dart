import 'package:flutter/material.dart';

class SearchEntry extends StatefulWidget {
  @override
  _SearchEntryState createState() => _SearchEntryState();
}

class _SearchEntryState extends State<SearchEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Diary"),
      ),
    );
  }
}
