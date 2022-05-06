import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonSearchField extends StatelessWidget {
  final TextEditingController controller;
  const PokemonSearchField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 30,
      ),
      child: CupertinoSearchTextField(
        controller: controller,
        placeholder: 'Procurar Pokémon',
        placeholderStyle: const TextStyle(color: Colors.white),
        itemColor: Colors.white,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
