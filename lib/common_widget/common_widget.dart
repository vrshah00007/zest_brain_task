import 'package:flutter/material.dart';
import 'package:zest_brain_task/constants/color_constants.dart';

class CommonButtonWidget extends StatelessWidget {
  String? titleText;
  Color? color;
  dynamic onPressed;

  CommonButtonWidget({Key? key, this.titleText, this.color,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: Text(titleText ?? ''),
    );
  }
}
