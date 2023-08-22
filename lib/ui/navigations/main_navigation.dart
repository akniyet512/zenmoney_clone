import 'package:flutter/material.dart';
import 'package:zenmoney_clone/ui/screens/authorization/authorization_screen.dart';
import 'package:zenmoney_clone/ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:zenmoney_clone/ui/screens/main/main_screen.dart';
import 'package:zenmoney_clone/ui/screens/sign_in/sign_in_screen.dart';
import 'package:zenmoney_clone/ui/screens/sign_up/sign_up_screen.dart';

abstract class MainNavigationRouteNames {
  static const String main = "/";
  static const String authorization = "/authorization";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";
  static const String forgotPassword = "/forgot-password";
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.main
      : MainNavigationRouteNames.authorization;

  final Map<String, Widget Function(BuildContext)> routes = {
    MainNavigationRouteNames.main: (context) => const MainScreen(),
    MainNavigationRouteNames.authorization: (context) => const AuthorizationScreen(),
    MainNavigationRouteNames.signIn: (context) => const SignInScreen(),
    MainNavigationRouteNames.signUp: (context) => const SignUpScreen(),
    MainNavigationRouteNames.forgotPassword: (context) => const ForgotPasswordScreen(),
  };

  Route<Object>? onGenerateRoute(RouteSettings settings) {
    // final Map<String, dynamic> args =
    //     settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      // case MainNavigationRouteNames.tasks:
      //   final int groupKey = args["groupKey"];
      //   final String title = args["title"];
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return TasksWidget(
      //         groupKey: groupKey,
      //         title: title,
      //       );
      //     },
      //     settings: RouteSettings(name: "${settings.name}/$groupKey"),
      //   );
      // case MainNavigationRouteNames.taskForm:
      //   final int groupKey = args["groupKey"];
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return TaskFormWidget(groupKey: groupKey);
      //     },
      //     settings: RouteSettings(
      //         name: "${MainNavigationRouteNames.tasks}/$groupKey/addTask"),
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("Navigation error!"),
              ),
            );
          },
        );
    }
  }
}
