import 'package:flutter/material.dart';

enum PokemonCardViewPage { info, description, stats }

class CardPageController {
  final pageController = PageController();
  late int _index;

  changeToPageIndex(int page) {
    pageController.jumpToPage(page);
  }

  changeToPage(PokemonCardViewPage page) {
    switch (page) {
      case PokemonCardViewPage.info:
        _index = 0;
        break;
      case PokemonCardViewPage.description:
        _index = 1;
        break;
      case PokemonCardViewPage.stats:
        _index = 2;
        break;
    }

    pageController.jumpToPage(_index);
  }
}
