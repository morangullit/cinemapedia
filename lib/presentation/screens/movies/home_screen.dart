import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

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
            movies: nowPlayingMovies,
            title: 'Proximamente',
            subTitle: 'En este Mes',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          
          MovieHorinzontalListview(
            movies: nowPlayingMovies,
            title: 'Populares',
            //subTitle: 'En este Mes',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
    
          MovieHorinzontalListview(
            movies: nowPlayingMovies,
            title: 'Mejor Calificadas',
            subTitle: 'Este mes',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),

          const SizedBox(height: 10,)
        ],
      );
        },
        childCount: 10
        )
      )
      ]
    );
  }
}
