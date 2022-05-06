import 'package:flutter/material.dart';

class FlatPokeball extends StatelessWidget {
  final double scale;
  const FlatPokeball({Key? key, this.scale = 18}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/flat-pokeball.png", scale: scale);
  }
}
