import 'package:flutter/material.dart';
import 'package:flutter_scale/provider/counter_provider.dart';
import 'package:flutter_scale/routers.dart';
import 'package:flutter_scale/themes/styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var userStep;
var initRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  userStep = sharedPreferences.getInt('userStep');

  if (userStep == 1) {
    initRoute = '/login';
  } else if (userStep == 2) {
    initRoute = '/dashboard';
  } else {
    initRoute = '/welcome';
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        //home: WelcomeScreen(),
        initialRoute: initRoute,
        routes: routes,
      ),
    );
  }
}
