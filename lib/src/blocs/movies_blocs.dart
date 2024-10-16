import 'package:rxdart/rxdart.dart';

import '../models/item_model.dart';
import '../resources/repository.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  // Observable yerine Stream kullanıyoruz
  Stream<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

class NowPlayingMoviesBloc{
  final _nowPlayingRepository = Repository();
  final _playingMoviesFetcher = PublishSubject<ItemModel>();
  Stream<ItemModel> get nowPlayingAllMovies => _playingMoviesFetcher.stream;

  fetchPlayingMovies() async {
    ItemModel itemModel = await _nowPlayingRepository.fetchAllPlayingMovies();
    _playingMoviesFetcher.sink.add(itemModel);
  }
  dispose(){
    _playingMoviesFetcher.close();
  }
}


class UpcomingMoviesBloc {
  final _upcomingRepository = Repository();
  final _upcomingFetcher = PublishSubject<ItemModel>();
  Stream<ItemModel> get fetchUpcomingMovies => _upcomingFetcher.stream;

  fetchUpcoming() async {
    ItemModel itemModel = await _upcomingRepository.fetchUpcomingMovies();
    _upcomingFetcher.sink.add(itemModel);
  }
  dispose(){
    _upcomingFetcher.close();
  }
}




final bloc = MoviesBloc();
final playingBloc = NowPlayingMoviesBloc();
final upComingBloc = UpcomingMoviesBloc();

