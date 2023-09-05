import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';

import '../../providers/providers.dart';


class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 1),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.video_label_outlined, color: colors.primary,),
                const SizedBox(width: 10),
                Text('Cinemapedia', style: titleStyle,),
                const Spacer(),
                IconButton(onPressed: () {

                  final movieRepository = ref.read(movieRepositoryProvider);
                  
                  showSearch(
                    context: context, 
                    delegate: SearchMovieDelegate(
                      searchMovies: movieRepository.searchMovies
                    )
                  );


                }, 
                icon: const Icon(Icons.search))
              ],
            ),
          ),
        ),
    );
  }
}