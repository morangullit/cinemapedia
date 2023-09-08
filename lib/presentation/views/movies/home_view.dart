import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRateMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          pinned: false,
          snap: true,
          title: CustomAppbar(),
        ),

        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
        children: [

          //const CustomAppbar(),

          MoviesSlideshow(movies: slideShowMovies),

          MovieHorinzontalListview(
            movies: nowPlayingMovies,
            title: 'En Cines',
            subTitle: 'Lunes 20',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
    
          MovieHorinzontalListview(
            movies: upcomingMovies,
            title: 'Proximamente',
            //subTitle: 'En este Mes',
            loadNextPage: () {
              ref.read(upcomingMoviesProvider.notifier).loadNextPage();
            },
          ),
          
          MovieHorinzontalListview(
            movies: popularMovies,
            title: 'Populares',
            //subTitle: 'En este Mes',
            loadNextPage: () {
              ref.read(popularMoviesProvider.notifier).loadNextPage();
            },
          ),
    
          MovieHorinzontalListview(
            movies: topRateMovies,
            title: 'Mejor Calificadas',
            subTitle: 'Este mes',
            loadNextPage: () {
              ref.read(topRatedMoviesProvider.notifier).loadNextPage();
            },
          ),

          const SizedBox(height: 10,)
        ],
      );
        },
        childCount: 1
        )
      )
      ]
    );
  }
}
