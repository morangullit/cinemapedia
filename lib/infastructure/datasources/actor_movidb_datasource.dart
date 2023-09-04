

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDataSource{

  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-MX',
      }
    ));


  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    
    final resp = await dio.get(
      '/movie/$movieId/credits'
    );

    final castResp = CreditsResponse.fromJson(resp.data);

    List<Actor> actors = castResp.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();

    return actors;
  }

}