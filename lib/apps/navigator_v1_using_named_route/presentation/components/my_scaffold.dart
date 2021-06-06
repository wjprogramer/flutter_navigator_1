import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/const/others.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/components/route_stack_container.dart';

class MyScaffold extends StatefulWidget {
  MyScaffold({
    this.title = '',
    this.bottomInfo,
    this.navigatorState,
  });

  final String title;
  final Widget? bottomInfo;
  final NavigatorState? navigatorState;

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading:
          Navigator.of(context).canPop() ?
            IconButton(
              onPressed: () async {
                // pop 之後再 setState，確保 stack 資訊被更新
                var navigator = Navigator.of(context);

                navigator.maybePop();
                navigator.setState(() { });
              },
              icon: Icon(Icons.arrow_back),
            ) : null,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RouteStackContainer(
            routeStack: myNavigatorObserver.routeStack,
            navigatorState: widget.navigatorState,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              physics: BouncingScrollPhysics(),
              child: widget.bottomInfo
            ),
          ),
        ],
      )
    );
  }
}
