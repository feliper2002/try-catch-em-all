import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_info_contract/pokemon_info_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokemon_info.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokedex_datasource/pokedex_datasource_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokemon_info_datasource/pokemon_info_datasource.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_info_contract/pokemon_info_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokedex_repository/pokedex_repository_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_info_repository/pokemon_info_repository_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/view/pokedex_list.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/view/pokemon_desc.dart';
import 'package:uno/uno.dart';

class PokedexModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Uno()),
        Bind((i) => PokedexDatasource(i.get<Uno>())),
        Bind((i) => PokemonInfoDatasource(i.get<Uno>())),
        Bind((i) => PokedexRepository(i.get<PokedexDatasourceContract>())),
        Bind((i) =>
            PokemonInfoRepository(i.get<PokemonInfoDatasourceContract>())),
        Bind((i) => GetPokedex(i.get<PokedexRepositoryContract>())),
        Bind((i) => GetPokemonInfo(i.get<PokemonInfoRepositoryContract>())),
        Bind((i) => PokedexController(
            i.get<GetPokedexContract>(), i.get<GetPokemonInfoContract>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const PokedexList()),
        ChildRoute('/info',
            child: (_, args) => PokemonDescription(url: args.data)),
      ];
}
