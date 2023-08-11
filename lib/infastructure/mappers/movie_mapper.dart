import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infastructure/models/moviedb/movie_detail.dart';
import 'package:cinemapedia/infastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'no-poster-found',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
    );

  static Movie movieDetailsToEntity( MovieDetail movie) => Movie(
      adult: movie.adult, 
      backdropPath: (movie.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
      : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg', 
      genreIds: movie.genres.map((e) => e.name).toList(),
      id: movie.id, 
      originalLanguage: movie.originalLanguage, 
      originalTitle: movie.originalTitle, 
      overview: movie.overview, 
      popularity: movie.popularity, 
      posterPath: (movie.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
      : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg', 
      releaseDate: movie.releaseDate, 
      title: movie.title, 
      video: movie.video, 
      voteAverage: movie.voteAverage, 
      voteCount: movie.voteCount
    );
}
