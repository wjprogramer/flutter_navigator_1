import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app.dart';
import 'package:flutter_navigator_1/shared/components/common.dart';

class AppListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: MyListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('App List'),
          ),
          MyButton(
            app: NavigatorV1App(),
            text: 'Navigator v1 (using named route)',
          ),
        ],
      ),
    );
  }
}
