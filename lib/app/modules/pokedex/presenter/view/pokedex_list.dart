import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:try_catch_em_all/utils/functions/caps_lock_index.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class PokedexList extends StatefulWidget {
  const PokedexList({Key? key}) : super(key: key);

  @override
  State<PokedexList> createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
  final controller = Modular.get<PokedexController>();

  @override
  void initState() {
    controller.getPokedex("5");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is PokedexLoadingState) return const Loader();

          if (value is PokedexSuccessState) {
            final entries = value.pokedex.pokemonEntries;
            return ListView.builder(
              itemCount: entries!.length,
              itemBuilder: (context, index) {
                final pokemon = entries[index];
                return GestureDetector(
                  onTap: () async {
                    await Modular.to.pushNamed('/info', arguments: pokemon.url);
                  },
                  child: Text(
                    capsLock(pokemon.name!),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              },
            );
          }

          return const Loader();
        },
      ),
    );
  }
}
