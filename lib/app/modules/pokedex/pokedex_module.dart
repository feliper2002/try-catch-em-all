import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_info_contract/pokemon_info_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/add_pokemon_party.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokemon_form.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokemon_info.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_trainer_party.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokedex_datasource/pokedex_datasource_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokemon_info_datasource/pokemon_info_datasource.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokemon_party_datasource/add_pokemon_party_datasource.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokemon_party_datasource/get_trainer_party_datasource.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_info_contract/pokemon_info_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokedex_repository/pokedex_repository_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_info_repository/pokemon_info_repository_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_party_repositories/add_pokemon_party_repository.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_party_repositories/get_trainer_party_repository.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/controllers/pokedex_controller.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/view/pokedex_list.dart';
import 'package:try_catch_em_all/app/modules/pokedex/presenter/view/pokemon_info_card/pokemon_info_card.dart';
import 'package:try_catch_em_all/app/modules/trainer/storage/trainer_storage.dart';
import 'package:try_catch_em_all/utils/constants/app_constants.dart';
import 'package:uno/uno.dart';

import 'domain/repositories/pokemon_form_contract/pokemon_form_contract.dart';
import 'external/pokemon_form_datasource/pokemon_form_datasource_impl.dart';
import 'infra/datasource/pokemon_form_contract/pokemon_form_contract.dart';
import 'infra/repositories/pokemon_form_repository/pokemon_form_repository_impl.dart';

class PokedexModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Uno()),
        Bind((i) => PokedexDatasource(i.get<Uno>())),
        Bind((i) => PokemonInfoDatasource(i.get<Uno>())),
        Bind((i) => PokemonFormDatasource(i.get<Uno>())),
        Bind((i) => PokedexRepository(i.get<PokedexDatasourceContract>())),
        Bind((i) =>
            PokemonInfoRepository(i.get<PokemonInfoDatasourceContract>())),
        Bind((i) =>
            PokemonFormRepository(i.get<PokemonFormDatasourceContract>())),
        Bind((i) => GetPokedex(i.get<PokedexRepositoryContract>())),
        Bind((i) => GetPokemonInfo(i.get<PokemonInfoRepositoryContract>())),
        Bind((i) => GetPokemonForm(i.get<PokemonFormRepositoryContract>())),

        /// [AddPokemonParty]
        Bind((i) => HasuraConnect(AppConstants.hasuraURL)),
        Bind((i) => AddPokemonPartyDatasource(i.get<HasuraConnect>())),
        Bind((i) =>
            AddPokemonPartyRepository(i.get<AddPokemonPartyDatasource>())),
        Bind((i) => AddPokemonParty(i.get<AddPokemonPartyRepository>())),

        /// [GetTrainerParty]
        Bind((i) => HasuraConnect(AppConstants.hasuraURL)),
        Bind((i) => GetTrainerPartyDatasource(i.get<HasuraConnect>())),
        Bind((i) =>
            GetTrainerPartyRepository(i.get<GetTrainerPartyDatasource>())),
        Bind((i) => GetTrainerParty(i.get<GetTrainerPartyRepository>())),

        Bind((i) => TrainerStorage()),

        Bind(
          (i) => PokedexController(
            i.get<GetPokedexContract>(),
            i.get<GetPokemonInfoContract>(),
            i.get<GetPokemonFormContract>(),
            i.get<AddPokemonParty>(),
            i.get<TrainerStorage>(),
            i.get<GetTrainerParty>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const PokedexList()),
        ChildRoute('/info',
            child: (_, args) => PokemonInfoCard(
                  id: args.data['id'],
                )),
      ];
}
