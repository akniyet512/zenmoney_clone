import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:zenmoney_clone/ui/screens/my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setPathUrlStrategy();
  runApp(const MyApp());
}

