import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider((ref) {

  final step1 = ref.watch(nowPlayingMoviesProvider);
  final step2 = ref.watch(popularMoviesProvider);
  final step3 = ref.watch(topRatedMoviesProvider);
  final step4 = ref.watch(upcomingMoviesProvider);

  if (step1.isEmpty || step2.isEmpty || step3.isEmpty || step4.isEmpty) return true;
  

  return false; // terminamos de cargar
});
