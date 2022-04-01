import 'package:flutter/material.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/card_page_controller.dart';

class PokemonInfoTab extends StatelessWidget {
  final CardPageController pageController;
  const PokemonInfoTab({Key? key, required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          child: const Text("Info", style: TextStyle(color: Colors.white)),
          onPressed: () {
            pageController.changeToPage(PokemonCardViewPage.info);
          },
        ),
        TextButton(
          child: const Text("Descrição", style: TextStyle(color: Colors.white)),
          onPressed: () {
            pageController.changeToPage(PokemonCardViewPage.description);
          },
        ),
        TextButton(
          child: const Text("Stats", style: TextStyle(color: Colors.white)),
          onPressed: () {
            pageController.changeToPage(PokemonCardViewPage.stats);
          },
        ),
      ],
    );
  }
}
