import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_list_tile.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_scaffold.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/mixin/my_base_state.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_3.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with MyBaseState {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Page1',
      bottomInfo: _bottomInfo(),
      navigatorState: navigatorState,
    );
  }

  Widget _bottomInfo() {
    return Column(
      children: [
        MyListTile(
          methodName: 'PushNamed',
          pageName: 'Page2',
          onTap: () async {
            await Navigator.of(context).pushNamed(RoutePaths.PAGE_2);
            safeSetState();
          },
        ),
        MyListTile(
          methodName: 'PopAndPushNamed',
          pageName: 'Page2',
          onTap: () async {
            await Navigator.of(context).popAndPushNamed(RoutePaths.PAGE_2);
            safeSetState();
          },
        ),
        MyListTile(
          methodName: 'Replace',
          pageName: 'Page3',
          onTap: () async {
            Navigator.of(context).replace(
              oldRoute: ModalRoute.of(context)!,
              newRoute: MaterialPageRoute(builder: (context) => Page3()),
            );
            safeSetState();
          },
        ),
      ],
    );
  }
}
