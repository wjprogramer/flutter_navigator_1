import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/root_app/screens/app_list_screen.dart';

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppListScreen(),
    );
  }
}
