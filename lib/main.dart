import 'package:flutter/material.dart';
import 'package:flutter_movies_app/home/splash_screen.dart';
import 'package:flutter_movies_app/my_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home/home_screen.dart';

void main(){
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              SplashScreen.routeName: (context) => SplashScreen(),
            },
            theme: MyTheme.darkTheme,
          );
        }
    );
  }
}
