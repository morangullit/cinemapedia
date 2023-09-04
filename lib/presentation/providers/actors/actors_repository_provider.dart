import 'package:cinemapedia/infastructure/datasources/actor_movidb_datasource.dart';
import 'package:cinemapedia/infastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Este repositorio es inmutable es solo lectura
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
  });

