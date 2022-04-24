import 'package:flutter/material.dart';

class BackBtnIcon extends StatelessWidget {
  final double? size;
  final Color? color;
  const BackBtnIcon({
    Key? key,
    this.size = 24,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: color,
        size: size,
      ),
    );
  }
}
