import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function? onPressed;
  final Widget? child;

  const CustomButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    return ElevatedButton(
      onPressed: onPressed as void Function(),
      child: child,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          textStyle: MaterialStateProperty.all(const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ))),
    );
  }
}
