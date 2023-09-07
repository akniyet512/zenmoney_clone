import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zenmoney_clone/resources/constants.dart';
import 'package:zenmoney_clone/ui/screens/my_app/my_app_model.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

class MultiLanguages {
  final Locale locale;
  MultiLanguages({this.locale = const Locale.fromSubtags(languageCode: Constants.defaultLocaleKey)});

  static MultiLanguages? of(BuildContext context) {
    return Localizations.of<MultiLanguages>(context, MultiLanguages);
  }

  void keepLocaleKey(String localeKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("localeKey");
    await prefs.setString("localeKey", localeKey);
  }

  Future<String> readLocaleKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("localeKey") ?? Constants.defaultLocaleKey;
  }

  void setLocale(BuildContext context, Locale locale) async {
    keepLocaleKey(locale.languageCode);
    NotifierProvider.read<MyAppModel>(context)?.changeLocale(locale: locale);
  }

  static const LocalizationsDelegate<MultiLanguages> delegate =
      _MultiLanguagesDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString("assets/languages/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key]!;
  }
}

class _MultiLanguagesDelegate extends LocalizationsDelegate<MultiLanguages> {
  const _MultiLanguagesDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'kk'].contains(locale.languageCode);
  }

  @override
  Future<MultiLanguages> load(Locale locale) async {
    MultiLanguages localizations = MultiLanguages(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_MultiLanguagesDelegate old) => false;
}