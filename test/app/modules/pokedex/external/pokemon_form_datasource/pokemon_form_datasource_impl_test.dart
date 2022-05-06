import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_form_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokemon_form_datasource/pokemon_form_datasource_impl.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

void main() {
  late PokemonFormDatasource datasource;
  late UnoMock client;

  setUpAll(() {
    client = UnoMock();
    datasource = PokemonFormDatasource(client);
  });

  test('Should return a PokemonFormModel from JSON response', () async {
    when(() => client.get(any())).thenAnswer(
      (_) async => Response(
        headers: {},
        request: Request(
          uri: Uri(),
          method: 'GET',
          headers: {},
          timeout: const Duration(),
        ),
        status: 200,
        data: _json,
      ),
    );

    final response = await datasource.getPokemonForm("392");

    expect(response, isA<PokemonFormModel>());
  });
}

const _json = {
  "form_name": "",
  "form_names": [],
  "form_order": 1,
  "id": 392,
  "is_battle_only": false,
  "is_default": true,
  "is_mega": false,
  "name": "infernape",
  "names": [],
  "order": 551,
  "pokemon": {
    "name": "infernape",
    "url": "https://pokeapi.co/api/v2/pokemon/392/"
  },
  "sprites": {
    "back_default":
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/392.png",
    "back_female": null,
    "back_shiny":
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/392.png",
    "back_shiny_female": null,
    "front_default":
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/392.png",
    "front_female": null,
    "front_shiny":
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/392.png",
    "front_shiny_female": null
  },
  "types": [
    {
      "slot": 1,
      "type": {"name": "fire", "url": "https://pokeapi.co/api/v2/type/10/"}
    },
    {
      "slot": 2,
      "type": {"name": "fighting", "url": "https://pokeapi.co/api/v2/type/2/"}
    }
  ],
  "version_group": {
    "name": "diamond-pearl",
    "url": "https://pokeapi.co/api/v2/version-group/8/"
  }
};
