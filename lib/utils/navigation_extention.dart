import 'package:flutter/material.dart';

extension NavigationExtention on BuildContext {
  void push(Route route) {
    Navigator.of(this).push(route);
  }

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pushAndRemoveUntil(Route route, RoutePredicate predicate) {
    Navigator.of(this).pushAndRemoveUntil(route, predicate);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
