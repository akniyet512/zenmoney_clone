import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:zenmoney_clone/ui/navigations/main_navigation.dart';
import 'package:zenmoney_clone/ui/screens/my_app/my_app_model.dart';
import 'package:zenmoney_clone/utilities/multilanguages.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final MainNavigation _mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    final MyAppModel model = NotifierProvider.watch<MyAppModel>(context)!;
    return MaterialApp(
      title: "ZenMoney",
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
      initialRoute: _mainNavigation.initialRoute(model.isAuth),
      locale: model.locale,
      supportedLocales: model.locales,
      localizationsDelegates: const [
        MultiLanguages.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (model.isLoading == true && model.mySharedPreferences != null) {
          for (var supportedLocaleLanguage in supportedLocales) {
            if (supportedLocaleLanguage.languageCode == locale?.languageCode &&
                supportedLocaleLanguage.countryCode == locale?.countryCode) {
              model.mySharedPreferences!
                  .setString("localeKey", locale!.languageCode);
              return supportedLocaleLanguage;
            }
          }
        }
        return null;
      },
    );
  }
}
