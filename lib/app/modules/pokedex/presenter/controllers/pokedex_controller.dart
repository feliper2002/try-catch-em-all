import 'package:flutter/material.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';

class PokedexController extends ValueNotifier<PokedexState> {
  PokedexController(this._getPokedexUsecase) : super(PokedexInitialState());

  final GetPokedexContract _getPokedexUsecase;

  Future<void> getPokedex(String pokedexID) async {
    final response = await _getPokedexUsecase(pokedexID);

    value = PokedexLoadingState();

    return response.fold(
      (error) {
        value = error;
      },
      (pokedex) {
        value = PokedexSuccessState(pokedex);
      },
    );
  }
}
