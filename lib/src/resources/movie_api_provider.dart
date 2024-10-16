import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'f457cb38fcf4bfe090ffc123833e3b68';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
   final response = await client.get(Uri.parse("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
    print(response.body.toString());
    if (response.statusCode == 200) {
  
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      
      throw Exception('Failed to load post');
    }
  }

  Future <ItemModel> fetchPlayingMovies() async {
    print('entered');
    final playingResponse = await client.get(Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey"));
    print(playingResponse.body.toString());
    if (playingResponse.statusCode==200) {
      return ItemModel.fromJson(json.decode(playingResponse.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<ItemModel> fetchUpcomingMovies() async {
    print('entered');
    final upcomingResponse = await client.get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey"));
    print(upcomingResponse.body.toString());
    if (upcomingResponse.statusCode == 200) {
      return ItemModel.fromJson(json.decode(upcomingResponse.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }


}