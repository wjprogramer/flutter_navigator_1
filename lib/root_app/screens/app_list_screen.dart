import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/shared/components/common.dart';

class AppListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App List'),
      ),
      body: MyListView(
        children: [

        ],
      ),
    );
  }
}
