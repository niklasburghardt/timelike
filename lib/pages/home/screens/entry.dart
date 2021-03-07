import 'package:flutter/material.dart';
import 'package:time_like/shared/card/story_card.dart';

class DiaryEntry extends StatefulWidget {
  @override
  _DiaryEntryState createState() => _DiaryEntryState();
}

class _DiaryEntryState extends State<DiaryEntry> {
  double _radius = 40;
  double _size = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry"),
      ),
    );
  }
}
