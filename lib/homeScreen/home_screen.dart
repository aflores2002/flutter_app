import 'package:flutter/material.dart';
import 'package:flutter_app/JobFinderScreen/job_finder_screen.dart';
import 'package:flutter_app/mentor/mentor_screen.dart';
import 'package:flutter_app/tabScreens/swipping_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List tabScreensList = [
    SwipingScreen(),
    const MentorScreen(),
    const JobsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber) {
          setState(() {
            screenIndex = indexNumber;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: screenIndex,
        items: const [
          // swipping screen
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: ""),

          // mentor screen
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                size: 30,
              ),
              label: ""),

          // user detail button
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 30,
              ),
              label: ""),
        ],
      ),
      body: tabScreensList[screenIndex],
    );
  }
}
