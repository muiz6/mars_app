import 'package:flutter/material.dart';
import 'package:mars_app/strings.dart';
import 'package:mars_app/ui/home/home_page.dart';
import 'package:mars_app/ui/themes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.APP_NAME,
      theme: Themes.DEFAULT_THEME,
      home: HomePage(title: Strings.APP_NAME),
    );
  }
}
