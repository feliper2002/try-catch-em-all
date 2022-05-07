import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:try_catch_em_all/utils/themes/app_colors.dart';
import 'package:try_catch_em_all/utils/widgets/loader.dart';

class PokeDescriptionPage extends StatefulWidget {
  final String url;
  const PokeDescriptionPage({Key? key, required this.url}) : super(key: key);

  @override
  State<PokeDescriptionPage> createState() => _PokeDescriptionPageState();
}

class _PokeDescriptionPageState extends State<PokeDescriptionPage> {
  final controller = Modular.get<PokedexController>();

  @override
  void initState() {
    controller.getPokemonInfo(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (_, value, child) {
          child = const Loader();
          if (value is PokedexPokemonInfoSuccessState) {
            final info = value.info;
            child = Text(info.description!);
          }
          if (value is PokedexLoadingState) {
            child = const Loader(color: AppColors.mainBgColor);
          }
          if (value is PokedexErrorState) {}
          return child;
        },
      ),
    );
  }
}
