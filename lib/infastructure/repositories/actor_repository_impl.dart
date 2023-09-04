


import 'package:cinemapedia/domain/datasource/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository{

  final ActorsDataSource dataSource;

  ActorRepositoryImpl(this.dataSource);
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    
    return dataSource.getActorsByMovie(movieId);

  }

}