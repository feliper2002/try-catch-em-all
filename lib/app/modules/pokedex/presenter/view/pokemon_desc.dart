import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class PokemonDescription extends StatefulWidget {
  final String? url;

  const PokemonDescription({Key? key, this.url}) : super(key: key);

  @override
  State<PokemonDescription> createState() => _PokemonDescriptionState();
}

class _PokemonDescriptionState extends State<PokemonDescription> {
  final controller = Modular.get<PokedexController>();

  @override
  void initState() {
    controller.getPokemonInfo(widget.url!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is PokedexPokemonInfoSuccessState) {
            return Center(
              child: Text(value.info.description!),
            );
          }
          return const Loader();
        },
      ),
    );
  }
}
