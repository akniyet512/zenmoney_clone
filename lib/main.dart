import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:zenmoney_clone/firebase_options.dart';
import 'package:zenmoney_clone/ui/screens/my_app/my_app.dart';
import 'package:zenmoney_clone/ui/screens/my_app/my_app_model.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  MyAppModel myAppModel = MyAppModel();
  myAppModel.checkOut();
  await myAppModel.setData().whenComplete(() {
    runApp(
      NotifierProvider(
        model: myAppModel,
        child: const MyApp(),
      ),
    );
  });
}
