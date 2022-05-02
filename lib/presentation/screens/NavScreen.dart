import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/screens/AddPropertyScreen.dart';
import 'package:flutter_job_one/presentation/screens/DetailScreen.dart';
import 'package:flutter_job_one/presentation/screens/EditProfileScreen.dart';
import 'package:flutter_job_one/presentation/screens/FavouriteScreen.dart';
import 'package:flutter_job_one/presentation/screens/HomeScreen.dart';
import 'package:flutter_job_one/presentation/screens/PropertyScreen.dart';
import 'package:flutter_job_one/utils/constants.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  final _screens = [
    HomeScreen(),
    FavouriteScreen(),
    AddPropertyScreen(),
    PropertyScreen(),
    EditProfileScreen(),
  ];

  final labelStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _currentIndex != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: COLOR_PRIMARY,
        onPressed: () {
          Navigator.pushNamed(context, addListingRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: COLOR_PRIMARY.withOpacity(0.3),
                spreadRadius: 20,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: COLOR_WHITE,
        selectedItemColor: COLOR_PRIMARY,
        unselectedItemColor: COLOR_GREY,
        // unselectedFontSize: 0,
        showUnselectedLabels: true,
        onTap: (index) => {
          if (index != 2)
            {
              setState(
                () => _currentIndex = index,
              ),
            }
          else
            {
              Navigator.pushNamed(context, addListingRoute),
            }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            activeIcon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: COLOR_WHITE,
            ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house_outlined),
            activeIcon: Icon(
              Icons.house,
            ),
            label: 'Properties',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            activeIcon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
