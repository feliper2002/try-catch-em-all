import 'package:flutter_modular/flutter_modular.dart';
import 'package:try_catch_em_all/app/modules/pokedex/pokedex_module.dart';
import 'package:try_catch_em_all/app/modules/trainer/trainer_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: PokedexModule()),
        ModuleRoute('/trainer', module: TrainerModule()),
      ];
}
