// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/bottom_nav/home_screen.dart';
import 'package:flutter_scale/screens/bottom_nav/notification_screen.dart';
import 'package:flutter_scale/screens/bottom_nav/profile_screen.dart';
import 'package:flutter_scale/screens/bottom_nav/report_screen.dart';
import 'package:flutter_scale/screens/bottom_nav/setting_screen.dart';
import 'package:flutter_scale/themes/color.dart';
import 'package:flutter_scale/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constant.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  //ສ້າງໂຕແປເກັບລຳດັບແທັບ
  int _currentIndex = 0;
  String _title = CustomStrings.appName;

  // ສ້າງໂຕແປແບບ List ເກັບໜ້າ Screen ຂອງ ແທັບ Bottom navigator
  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  //ຟັງຊັນ ສະລັບແທັບ
  void onTabChange(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = CustomStrings.bottom_menu_home_text;
          break;
        case 1:
          _title = CustomStrings.bottom_menu_report_text;
          break;
        case 2:
          _title = CustomStrings.bottom_menu_notification_text;
          break;
        case 3:
          _title = CustomStrings.bottom_menu_setting_text;
          break;
        case 4:
          _title = CustomStrings.bottom_menu_profile_text;
          break;
      }
    });
  }

  //ສ້າງຟັງຊັນສຳລັບອ່ານຂໍ້ມູນ profile ຈາກ share preference
  String? _fullname, _username, _avartar, _userstatus;
  readUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _fullname = sharedPreferences.getString('fullName');
      _username = sharedPreferences.getString('userName');
      _avartar = sharedPreferences.getString('imageProfile');
      _userstatus = sharedPreferences.getString('userStatus');
    });
  }

  @override
  void initState() {
    readUserProfile();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _children[_currentIndex],
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(_fullname ?? '...'),
                accountEmail: Text(_username ?? '...'),
                currentAccountPicture: _avartar != null
                    ? CircleAvatar(
                        radius: 60,
                        backgroundColor: primary_dark,
                        backgroundImage:
                            NetworkImage('${baseImageURL}profile/${_avartar}'),
                      )
                    : CircularProgressIndicator()),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(CustomStrings.drawer_menu_about_text),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(CustomStrings.drawer_menu_info_text),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, '/info');
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(CustomStrings.drawer_menu_contact_text),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(CustomStrings.drawer_menu_logout_text),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setInt('userStep', 1);

                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabChange,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.report_outlined,
              ),
              label: CustomStrings.bottom_menu_report_text),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_outlined,
              ),
              label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Setting'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
