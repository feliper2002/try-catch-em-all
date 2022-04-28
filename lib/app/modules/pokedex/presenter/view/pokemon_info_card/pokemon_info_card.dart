import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/card_page_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/view/pokemon_info_card/widgets/pokemon_image_screen.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/view/pokemon_info_card/widgets/pokemon_info_tab.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/widgets/pokemon_type_tag/pokemon_type_tag.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:try_catch_em_all/app/modules/trainer/storage/trainer_storage.dart';
import 'package:try_catch_em_all/utils/functions/caps_lock_index.dart';
import 'package:try_catch_em_all/utils/themes/app_colors.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class PokemonInfoCard extends StatefulWidget {
  final String? url;
  final String? id;
  final String? name;

  const PokemonInfoCard({Key? key, this.url, this.id, this.name})
      : super(key: key);

  @override
  State<PokemonInfoCard> createState() => _PokemonInfoCardState();
}

class _PokemonInfoCardState extends State<PokemonInfoCard> {
  final controller = Modular.get<PokedexController>();

  late TrainerStorage storage;

  @override
  void initState() {
    controller.getPokemonForm(widget.id!);
    storage = TrainerStorage();
    super.initState();
  }

  @override
  void dispose() {
    controller.getPokedex("1");
    super.dispose();
  }

  final pageController = CardPageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is PokedexPokemonFormSuccessState) {
            final form = value.form;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      "${capsLock(form.name!)} #${form.id.toString().padLeft(3, '0')}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 20),
                  PokemonImageScreen(sprite: form.spriteFrontDefault!),
                  ElevatedButton(
                    onPressed: () async {
                      // ! VER URGENTE
                      final trainerID = await storage.id;
                      await controller.addPokemonParty("${form.id}", trainerID);
                    },
                    child: Container(
                      color: AppColors.darkGrey,
                      child: const Text("Adicionar ao time"),
                    ),
                  ),
                  PokemonInfoTab(pageController: pageController),
                  SizedBox(
                    height: size.height * .5,
                    child: PageView(
                      controller: pageController.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          height: size.height * .5,
                          width: size.width,
                          color: Colors.white,
                        ),
                        Container(
                          height: size.height * .5,
                          width: size.width,
                          color: Colors.grey,
                        ),
                        Container(
                          height: size.height * .5,
                          width: size.width,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Loader(color: Colors.white);
        },
      ),
    );
  }
}
