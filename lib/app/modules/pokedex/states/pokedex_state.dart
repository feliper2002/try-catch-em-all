abstract class PokedexState {}

class PokedexInitialState extends PokedexState {}

class PokedexLoadingState extends PokedexState {}

class PokedexSuccessState extends PokedexState {}

class PokedexErrorState extends PokedexState {
  final String? message;

  PokedexErrorState(this.message);
}
