import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final List<Widget> children;
  final ScrollController? controller;

  const MyListView({
    this.children = const <Widget>[],
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      controller: controller,
      children: children,
    );
  }
}

class MyButton extends StatelessWidget {
  final Function? onPressed;
  final Widget? app;
  final Widget? page;
  final Widget? child;
  final String? text;

  const MyButton({
    this.onPressed,
    this.app,
    this.page,
    this.child,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!.call();
        }
        if (page != null) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => page!),
          );
        }
        if (app != null) {
          runApp(app!);
        }
      },
      child: child ?? Text(text ?? '')
    );
  }
}

