import 'package:flutter/material.dart';
import 'package:sm_project/src/ui/movie_details.dart';
import 'package:sm_project/src/ui/widgets/app_bar_widget.dart';

import '../blocs/movies_blocs.dart';
import '../models/item_model.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    upComingBloc.fetchUpcoming();
    return Scaffold(
      appBar: CustomAppBar().customAppBar('Coming Soon'),
      body: StreamBuilder(
        stream: upComingBloc.fetchUpcomingMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot){
           if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
  return GridView.builder(
    itemCount: snapshot.data?.results.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,  // Dikey boşluk
      crossAxisSpacing: 8.0, // Yatay boşluk
      childAspectRatio: 0.7, // Kartın en-boy oranı
    ),
    padding: const EdgeInsets.all(8.0), // Grid'e dış boşluk ekleyin
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // Resmin köşelerini yuvarla
              child: AspectRatio(
                aspectRatio: 2 / 3, // Resim ve butonun en-boy oranı
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero, // Butonun içinde boşluk bırakma
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetails(snapshot: snapshot, index: index),
                      ),
                    );
                  },
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w185${snapshot.data?.results[index].poster_path}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
}