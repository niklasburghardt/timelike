import 'package:flutter/material.dart';

class StoryCard extends StatefulWidget {
  @override
  StoryCardState createState() => StoryCardState();
}

class StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
          color: Colors.grey[100],
          borderOnForeground: true,
          shadowColor: Colors.lightBlue[200],
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "Bike Trip",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal[400],
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "Lorem ipsum sd alskddj  sldkf hc sdf sdf sdf sdfdfsdf sdf sdin fin ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontFamily: "NotoSans"),
                ),
              )
            ],
          )),
    );
  }
}
