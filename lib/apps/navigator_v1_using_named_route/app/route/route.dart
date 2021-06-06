import 'package:flutter/material.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/home_page.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_1.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_2.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_3.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_4.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_5.dart';
import 'package:flutter_navigator_1/apps/navigator_v1_using_named_route/presentation/screens/page_6.dart';

class RoutePaths {
  static const HOME = 'home';

  static const PAGE_1 = 'page_1';
  static const PAGE_2 = 'page_2';
  static const PAGE_3 = 'page_3';
  static const PAGE_4 = 'page_4';
  static const PAGE_5 = 'page_5';
  static const PAGE_6 = 'page_6';
}

// final RouteFactory onGenerateRoute  = (RouteSettings settings) {
//   switch (settings.name) {
//     case RoutePaths.HOME:
//       return commonPageRoute(HomePage());
//     case RoutePaths.PAGE_1:
//       return commonPageRoute(Page1());
//
//   }
//
//   return commonPageRoute(ErrorPage());
// };

Map<String, WidgetBuilder> routes = {
  RoutePaths.HOME:    (context) => HomePage(),
  RoutePaths.PAGE_1:  (context) => Page1(),
  RoutePaths.PAGE_2:  (context) => Page2(),
  RoutePaths.PAGE_3:  (context) => Page3(),
  RoutePaths.PAGE_4:  (context) => Page4(),
  RoutePaths.PAGE_5:  (context) => Page5(),
  RoutePaths.PAGE_6:  (context) => Page6(),
};