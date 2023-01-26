import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/dash_board/dash_board_screen.dart';
import 'package:flutter_scale/screens/drawer_menu/about_screen.dart';
import 'package:flutter_scale/screens/drawer_menu/contact_screen.dart';
import 'package:flutter_scale/screens/drawer_menu/info.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
import 'package:flutter_scale/screens/new_detail/news_detail_screen.dart';
import 'package:flutter_scale/screens/welcome/welcome_screen.dart';

//create value url page

Map<String, WidgetBuilder> routes = {
  "/dashboard": (BuildContext context) => DashBoardScreen(),
  "/about": (BuildContext context) => AboutScreen(),
  "/info": (BuildContext context) => InfoScreen(),
  "/contact": (BuildContext context) => ContactScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/welcome": (BuildContext context) => WelcomeScreen(),
  "/newsdetail": (BuildContext context) => NewsDetailScreen(),
};
