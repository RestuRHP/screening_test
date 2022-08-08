import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {

  CommonButtonWidget({ 
    super.key,
    required this.onPressed,
    this.child, 
    this.bgColor, 
    this.elevation = 0,
    this.fullSizeButton = true,
    this.border = BorderSide.none,
    this.padding = const EdgeInsets.all(13)
  });

  Widget? child;
  Color? bgColor;
  double? elevation;
  EdgeInsetsGeometry padding;
  bool fullSizeButton;

  BorderSide border;
  
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: border
      ),
      color: bgColor,
      minWidth: fullSizeButton ? double.infinity : null,
      elevation: elevation,
      padding: padding,
      child: child,
    );
  }

}