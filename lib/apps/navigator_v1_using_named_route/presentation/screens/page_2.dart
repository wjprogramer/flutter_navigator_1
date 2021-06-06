import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_list_tile.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_scaffold.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/mixin/my_base_state.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with MyBaseState {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Page2',
      bottomInfo: _bottomInfo(),
      navigatorState: navigatorState,
    );
  }

  Widget _bottomInfo() {
    return Column(
      children: [
        MyListTile(
          methodName: 'PushNamed',
          pageName: 'Page3',
          onTap: () async {
            await Navigator.of(context).pushNamed(RoutePaths.PAGE_3);
            safeSetState();
          },
        ),
        MyListTile(
          methodName: 'PushReplacementNamed',
          pageName: 'Page3',
          onTap: () async {
            await Navigator.of(context).pushReplacementNamed(RoutePaths.PAGE_3);
            safeSetState();
          },
        ),
      ],
    );
  }
}
