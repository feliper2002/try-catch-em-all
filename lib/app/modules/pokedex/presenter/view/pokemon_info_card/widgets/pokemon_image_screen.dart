import 'package:flutter/material.dart';

class PokemonImageScreen extends StatelessWidget {
  final String? sprite;
  const PokemonImageScreen({Key? key, this.sprite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .3,
      width: size.width * .6,
      child: Image.network(sprite!, scale: .5),
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 12,
          color: Colors.grey[300]!,
        ),
      ),
    );
  }
}
