import 'package:cinemapedia/domain/entities/movie.dart';


abstract class MoviRepository {

  Future<List<Movie>> getNowPlaying({ int page = 1});

}