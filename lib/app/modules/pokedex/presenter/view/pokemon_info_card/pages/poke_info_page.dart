import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_form.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/widgets/pokemon_type_tag/pokemon_type_tag.dart';

class PokeInfoPage extends StatefulWidget {
  final PokemonForm form;
  const PokeInfoPage({Key? key, required this.form}) : super(key: key);

  @override
  State<PokeInfoPage> createState() => _PokeInfoPageState();
}

class _PokeInfoPageState extends State<PokeInfoPage> {
  final controller = Modular.get<PokedexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          PokemonTypeTag(types: widget.form.types),
        ],
      ),
    );
  }
}
