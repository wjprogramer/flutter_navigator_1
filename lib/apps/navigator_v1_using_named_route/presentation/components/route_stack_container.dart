import 'dart:math' as math;

import 'package:flutter/material.dart';

class RouteStackContainer extends StatefulWidget {

  RouteStackContainer({
    required this.routeStack,
    this.navigatorState,
  });

  final List<Route<dynamic>> routeStack;
  final NavigatorState? navigatorState;

  @override
  _RouteStackContainerState createState() => _RouteStackContainerState();
}

class _RouteStackContainerState extends State<RouteStackContainer> with TickerProviderStateMixin {
  late List<Route<dynamic>> _routeStack;

  late AnimationController _animationController;
  late Animation<double> animation;

  Duration _toggleDuration = const Duration(milliseconds: 300);

  bool isOpen = false;

  var collapseIcon = Icons.expand_more;
  var expandIcon = Icons.expand_more;

  var iconRotationAngle = -math.pi;

  @override
  void initState() {
    super.initState();

    _routeStack = widget.routeStack;

    _animationController = AnimationController(
      vsync: this,
      duration: _toggleDuration,
    )
      ..addListener(() {
        setState(() {

        });
      });

    animation = _animationController.drive(Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.fastOutSlowIn)));

    if (isOpen) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 16, top: 16, left: 0, right: 0),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(child: _title('Some Info')),
                  _expandButton(),
                ],
              ),
              SizeTransition(
                axisAlignment: 1.0,
                sizeFactor: animation,
                child: _routeInfo(),
              ),
              _title('Route Stack'),
              ..._stackContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      child: Text(title, style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold,),),
    );
  }

  Widget _routeInfo() {
    if (widget.navigatorState == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          'navigatorState.canPop: ${widget.navigatorState?.canPop()}',
          'ModalRoute.of(context).canPop: ${ModalRoute.of(context)?.canPop}',
          'ModalRoute.of(context).isFirst: ${ModalRoute.of(context)?.isFirst}',
          'ModalRoute.of(context).isCurrent: ${ModalRoute.of(context)?.isCurrent}',
          'ModalRoute.of(context).isActive: ${ModalRoute.of(context)?.isActive}',
        ].map((e) =>
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(e),
          )
        ).toList(),
      ),
    );
  }

  List<Widget> _stackContent() {
    return [
      ...List.generate(
          _routeStack.length * 2 - 1, (index) {
        if (index % 2 != 0) {
          return Divider();
        }

        var routeIndex = index ~/ 2;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,),
          child: Text(_routeStack[routeIndex].settings.name ?? ' -- '),
        );
      }),
    ];
  }

  Widget _expandButton() {
    return GestureDetector(
      onTap: () {
        if (!isOpen) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }

        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final showSecondIcon = collapseIcon != expandIcon &&
                  _animationController.value >= 0.5;

              return Transform.rotate(
                angle: iconRotationAngle *
                    (showSecondIcon
                        ? -(1.0 - _animationController.value)
                        : _animationController.value),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    showSecondIcon ? collapseIcon : expandIcon,
                    size: 24.0,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
