import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/view/pokemon_info_card/widgets/pokemon_search_field.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/view/pokemon_info_card/widgets/pokemon_tile.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:try_catch_em_all/app/modules/trainer/storage/trainer_storage.dart';
import 'package:try_catch_em_all/utils/themes/app_colors.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class PokedexList extends StatefulWidget {
  const PokedexList({Key? key}) : super(key: key);

  @override
  State<PokedexList> createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
  final controller = Modular.get<PokedexController>();

  final TrainerStorage storage = TrainerStorage();

  @override
  void initState() {
    storage.trainerExists().then((exists) {
      if (exists) {
        return;
      } else {
        Modular.to.navigate("/trainer/create");
      }
    });

    controller.getPokedex("1");

    controller.searchController.addListener(() {
      controller.getPokedex("1");
    });

    super.initState();
  }

  @override
  void dispose() {
    storage.trainerExists().then((exists) {
      if (exists) {
        controller.dispose();
      } else {
        return;
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBgColor,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              await Modular.to.pushNamed('/trainer/');
            },
            icon: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          PokemonSearchField(
            controller: controller.searchController,
          ),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              if (value is PokedexLoadingState) {
                return const Loader();
              }

              if (value is PokedexSuccessState) {
                final entries = value.pokedex.pokemonEntries;
                return Expanded(
                  child: ListView.builder(
                    itemCount: entries!.length,
                    itemBuilder: (context, index) {
                      final pokemon = entries[index];
                      return PokemonTile(pokemon: pokemon);
                    },
                  ),
                );
              }

              return const Loader();
            },
          ),
        ],
      ),
    );
  }
}
