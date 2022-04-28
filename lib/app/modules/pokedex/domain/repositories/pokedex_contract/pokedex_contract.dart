import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';

abstract class PokedexRepositoryContract {
  Future<Either<LoadDataError, Pokedex>> getPokedex(String pokedexID);
}
