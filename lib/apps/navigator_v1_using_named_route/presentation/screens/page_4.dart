import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/const/others.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/page_route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_list_tile.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_scaffold.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/route_stack_container.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/mixin/my_base_state.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_5.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> with MyBaseState {
  NavigatorState? _navigatorState;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _navigatorState = Navigator.of(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Page4',
      bottomInfo: _bottomInfo(),
      navigatorState: _navigatorState,
    );
  }

  Widget _bottomInfo() {
    return Column(
      children: [
        MyListTile(
          methodName: 'PushNamed',
          pageName: 'Page5',
          onTap: () async {
            await Navigator.of(context).pushNamed(RoutePaths.PAGE_5);
            _setState();
          },
        ),
        MyListTile(
          methodName: 'PushReplacement',
          pageName: 'Page5',
          onTap: () async {
            await Navigator.of(context).pushReplacement(commonPageRoute(Page5()));
            _setState();
          },
        ),
      ],
    );
  }

  void _setState() async {
    // if (mounted && ModalRoute.of(context).isCurrent) {
    //   _setState();
    // }
    _navigatorState?.setState(() { });
  }
}
