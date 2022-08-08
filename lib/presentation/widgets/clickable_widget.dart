import 'package:flutter/material.dart';

class ClickableWidget extends StatelessWidget {

  final Widget child;
  final Color color;
  final Function? onClick;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin; 

  ClickableWidget({
    required this.child,
    this.color = Colors.white,
    this.borderRadius,
    this.onClick,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    borderRadius ??= BorderRadius.circular(12);

    Widget clickableWidget = Material(
      borderRadius: borderRadius,
      color: color,
      child: InkWell(
        onTap: () => onClick?.call(),
        borderRadius: borderRadius,
        child: child,
      )
    );

    if( margin != null ) {
      clickableWidget = Padding(
        padding: margin!,
        child: clickableWidget,
      );
    }

    return clickableWidget;
  }

}