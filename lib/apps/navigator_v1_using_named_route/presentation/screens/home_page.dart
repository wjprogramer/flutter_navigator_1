import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_list_tile.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_scaffold.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/mixin/my_base_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MyBaseState {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Home',
      bottomInfo: _bottomInfo(),
      navigatorState: navigatorState,
    );
  }

  Widget _bottomInfo() {
    return Column(
      children: [
        MyListTile(
          methodName: 'PushNamed',
          pageName: 'Page1',
          onTap: () async {
            await Navigator.of(context).pushNamed(RoutePaths.PAGE_1);
            safeSetState();
          },
        ),
        // MyListTile(
        //   methodName: 'PushNamed',
        //   pageName: 'PageX',
        //   onTap: () async {
        //     await Navigator.of(context).pushNamed(RoutePaths.PAGE_1);
        //     _setState();
        //   },
        // ),
      ],
    );
  }
}
