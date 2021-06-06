import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_list_tile.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_scaffold.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/mixin/my_base_state.dart';

class Page6 extends StatefulWidget {
  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> with MyBaseState {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Page6',
      bottomInfo: _bottomInfo(),
      navigatorState: navigatorState,
    );
  }

  Widget _bottomInfo() {
    return Column(
      children: [
        MyListTile(
          methodName: 'PushNamedAndRemoveUntil',
          pageName: 'HomePage',
          onTap: () async {
            await Navigator.of(context).pushNamedAndRemoveUntil(
              RoutePaths.HOME,
                  (Route<dynamic> route) => false,
            );
            safeSetState();
          },
        ),
        MyListTile(
          methodName: 'PopUntil',
          pageName: 'Home',
          comment: '不能把所有東西 pop 掉',
          onTap: () async {
            Navigator.of(context).popUntil(
                  (Route<dynamic> route) => route.settings.name == RoutePaths.HOME,
            );
            safeSetState();
          },
        ),
        MyListTile(
          methodName: 'PopUntil',
          pageName: 'First',
          onTap: () async {
            Navigator.of(context).popUntil(
                  (Route<dynamic> route) => route.isFirst,
            );
            safeSetState();
          },
        ),
      ],
    );
  }
}
