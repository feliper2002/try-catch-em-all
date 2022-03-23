import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokedex_datasource/pokedex_datasource_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokedex_repository/pokedex_repository_impl.dart';
import 'package:uno/uno.dart';

class PokedexModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Uno()),
        Bind((i) => PokedexDatasource(i.get<Uno>())),
        Bind((i) => PokedexRepository(i.get<PokedexDatasourceContract>())),
        Bind((i) => GetPokedex(i.get<PokedexRepositoryContract>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => Container()),
      ];
}
