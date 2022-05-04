import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:try_catch_em_all/utils/widgets/flat_pokeball.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class TrainerPartyPage extends StatefulWidget {
  const TrainerPartyPage({Key? key}) : super(key: key);

  @override
  State<TrainerPartyPage> createState() => _TrainerPartyPageState();
}

class _TrainerPartyPageState extends State<TrainerPartyPage> {
  final controller = Modular.get<PokedexController>();

  @override
  void initState() {
    controller.getTrainerParty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (_, value, child) {
          child = const Loader();
          if (value is PokedexPokemonListTrainerPartyState) {
            final party = value.party;
            child = ListView.builder(
              itemCount: party.length,
              itemBuilder: (_, index) {
                final poke = party[index];
                return GestureDetector(
                  onTap: () async {
                    final number = NumberFormat().parse(poke.number).toInt();
                    await Modular.to
                        .pushNamed("/info", arguments: {"id": "$number"});
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        const FlatPokeball(),
                        const SizedBox(width: 6),
                        Text(poke.number),
                        const Spacer(),
                        Text(poke.name),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (value is PokedexLoadingState) {
            child = const Loader();
          }
          if (value is PokedexErrorState) {
            child = Center(child: Text(value.message!));
          }
          return child;
        },
      ),
    );
  }
}
