import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/const/others.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_list_tile.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_scaffold.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/route_stack_container.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/mixin/my_base_state.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with MyBaseState {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Page3',
      bottomInfo: _bottomInfo(),
      navigatorState: navigatorState,
    );
  }

  Widget _bottomInfo() {
    return Column(
      children: [
        MyListTile(
          methodName: 'PushNamed',
          pageName: 'Page4',
          onTap: () async {
            await Navigator.of(context).pushNamed(RoutePaths.PAGE_4);
            safeSetState();
          },
        ),
      ],
    );
  }
}
