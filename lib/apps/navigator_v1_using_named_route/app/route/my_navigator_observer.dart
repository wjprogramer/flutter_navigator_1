import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  List<Route<dynamic>> routeStack = [];

  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
  }

  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didRemove(Route? route, Route? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    routeStack.removeLast();
    routeStack.add(newRoute!);
  }
}