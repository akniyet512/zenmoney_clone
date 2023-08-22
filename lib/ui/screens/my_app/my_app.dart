import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';
import 'package:zenmoney_clone/ui/screens/my_app/my_app_model.dart';

class MyApp extends StatelessWidget {
  final MyAppModel myAppModel;

  const MyApp({
    super.key,
    required this.myAppModel,
  });

  static final MainNavigation _mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      routes: _mainNavigation.routes,
      onGenerateRoute: _mainNavigation.onGenerateRoute,
      initialRoute: _mainNavigation.initialRoute(myAppModel.isAuth),
    );
  }
}
