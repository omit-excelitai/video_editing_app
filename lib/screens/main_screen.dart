import 'package:flutter/material.dart';
import 'package:video_editing_app/components/colors.dart';
import 'package:video_editing_app/screens/bottom_nav_bar/create_screen.dart';
import 'package:video_editing_app/screens/bottom_nav_bar/mix_screen.dart';
import 'package:video_editing_app/screens/bottom_nav_bar/profile_screen.dart';
import 'package:video_editing_app/screens/bottom_nav_bar/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  static const List<Widget> _screen = <Widget>[
    MixScreen(),
    SearchScreen(),
    CreateScreen(),
    ProfileScreen(),
  ];

  _onSelectedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // leading: ClipOval(
        //     child: Image.network('https://img.favpng.com/13/16/11/cartoon-gold-crown-png-favpng-ejYsiTP5FzZZmRTeQvupQR82u.jpg',height:5,width: 5,)),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.tv_sharp,
                color: AppColor.appBarIconColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help,
                color: AppColor.appBarIconColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_add,
                color: AppColor.appBarIconColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: AppColor.appBarIconColor)),
        ],
      ),
      body: Center(
        child: _screen.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.dashboard_customize),
              label: 'Mix'),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.add_circle),
              label: 'Create'),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.person),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onSelectedItem,
      ),
    );
  }
}
