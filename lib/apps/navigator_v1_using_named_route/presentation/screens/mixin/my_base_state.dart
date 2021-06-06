import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/app/const/others.dart';

mixin MyBaseState<T extends StatefulWidget> on State<T> implements RouteAware {
  NavigatorState? navigatorState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      navigatorState = Navigator.of(context);
      setState(() {});
    });
  }

  void safeSetState([Function? fn]) {
    // if (mounted && ModalRoute.of(context).isCurrent) {
    //   _setState();
    // }
    if (mounted) {
      navigatorState?.setState(() { });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    myRouteObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    myRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    print('didPop');
    safeSetState();
  }

  @override
  void didPopNext() {
    print('didPopNext');
    safeSetState();
  }

  @override
  void didPush() {
    print('didPush');
    safeSetState();
  }

  @override
  void didPushNext() {
    print('didPushNext');
    safeSetState();
  }
}