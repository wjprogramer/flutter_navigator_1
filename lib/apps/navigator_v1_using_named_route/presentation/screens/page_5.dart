import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/const/others.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/page_route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/route/route.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_list_tile.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/my_scaffold.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/route_stack_container.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/mixin/my_base_state.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_6.dart';

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> with MyBaseState {
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
      title: 'Page5',
      bottomInfo: _bottomInfo(),
      navigatorState: _navigatorState,
    );
  }

  Widget _bottomInfo() {
    return Column(
      children: [
        // MyListTile(
        //   methodName: 'PushNamed',
        //   pageName: 'HomePage',
        //   onTap: () async {
        //     await Navigator.of(context).pushNamed(RoutePaths.HOME);
        //     _setState();
        //   },
        // ),
        MyListTile(
          methodName: 'PushNamedAndRemoveUntil',
          pageName: 'Page6',
          comment: '1. 刪掉 { 條件 = page2 } ～ { 其他路徑 }，並且push page 6\n'
              '2. 任何路徑 { 條件 = page2 } 不成立，page 6 會變成第一頁',
          onTap: () async {
            await Navigator.of(context).pushNamedAndRemoveUntil(
                RoutePaths.PAGE_6,
                    (Route<dynamic> route) => route.settings.name == RoutePaths.PAGE_2
            );
            _setState();
          },
        ),
        MyListTile(
          methodName: 'Push',
          pageName: 'Page6',
          onTap: () async {
            await Navigator.of(context).push(commonPageRoute(Page6()));
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
