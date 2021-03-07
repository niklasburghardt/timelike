import 'package:concentric_transition/page_route.dart';
import 'package:flutter/material.dart';
import 'package:time_like/pages/entry_modules/create.dart';
import 'package:time_like/pages/home/screens/entry.dart';
import 'package:time_like/pages/home/screens/homepage.dart';
import 'package:time_like/pages/home/screens/search.dart';
import 'package:time_like/pages/home/screens/stats.dart';
import 'package:time_like/pages/home/screens/friends.dart';
import 'package:time_like/shared/constants.dart';
import 'package:transition_x/transition_x.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomePage homePage;
  SearchEntry search;
  DiaryEntry diaryEntry;
  Friends upcoming;
  DiaryStats statistics;
  List<Widget> pages;
  Widget currentWidget;
  int _currentIndex = 0;

  @override
  void initState() {
    homePage = HomePage();
    search = SearchEntry();
    diaryEntry = DiaryEntry();
    upcoming = Friends();
    statistics = DiaryStats();
    pages = [homePage, search, diaryEntry, upcoming, statistics];
    currentWidget = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentWidget,
        floatingActionButton: FloatingActionButton(
          heroTag: "dash",
          backgroundColor: kPrimaryColor.withOpacity(1),
          onPressed: () {
            Navigator.pushNamed(context, "/create");
          },
          child: Icon(
            Icons.add,
          ),
          elevation: 10,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: kSecondaryColor.withOpacity(1),
          unselectedItemColor: kGreyColor.withOpacity(1),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          elevation: 10,
          backgroundColor: Colors.grey[800],
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("Add"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mobile_friendly_sharp),
              title: Text("Trending"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              title: Text("User"),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              currentWidget = pages[index];
            });
          },
        ));
  }
}
