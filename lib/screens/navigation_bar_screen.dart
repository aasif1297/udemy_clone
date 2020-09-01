import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:udemy_clone/screens/all_courses_screen.dart';
import 'package:udemy_clone/screens/favourite_screen.dart';
import 'package:udemy_clone/screens/homepage.dart';
import 'package:udemy_clone/screens/my_courses_screen.dart';
import 'package:udemy_clone/screens/profile_screen.dart';

class NavBarScreen extends StatelessWidget {
  PersistentTabController _controller;
  bool _hideNavBar = false;
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      AllCoursesScreen(),
      MyCoursesScreen(),
      FavouriteCoursesScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColor: Color(0xFFFC3B39),
        inactiveColor: Color(0xFF979797),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColor: Color(0xFFFC3B39),
        inactiveColor: Color(0xFF979797),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.play_circle_outline),
        title: ("My Courses"),
        activeColor: Color(0xFFFC3B39),
        inactiveColor: Color(0xFF979797),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_border),
        title: ("Favourites"),
        activeColor: Color(0xFFFC3B39),
        inactiveColor: Color(0xFF979797),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle),
        title: ("Account"),
        activeColor: Color(0xFFFC3B39),
        inactiveColor: Color(0xFF979797),
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.business_center),
      //   title: ("Jobs"),
      //   activeColor: Color(0xFFF78914),
      //   inactiveColor: Color(0xFFF78914),
      // )
      /*PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications),
        title: ("Notifications"),
        activeColor: Colors.cyan,
        inactiveColor: Colors.grey,
      ),*/
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white70,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      hideNavigationBar: _hideNavBar,
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white, borderRadius: BorderRadius.zero),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property
    );
  }
}
