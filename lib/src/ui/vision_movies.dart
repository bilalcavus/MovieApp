import 'package:flutter/material.dart';
import 'package:sm_project/src/blocs/movies_blocs.dart';
import 'package:sm_project/src/models/item_model.dart';
import 'package:sm_project/src/ui/movie_details.dart';
import 'package:sm_project/src/ui/page_management.dart';
import 'package:sm_project/src/ui/widgets/app_bar_widget.dart';

class VisionMovies extends StatefulWidget {
  const VisionMovies({super.key});

  @override
  State<VisionMovies> createState() => _VisionMoviesState();
}

class _VisionMoviesState extends State<VisionMovies> {
  @override
  Widget build(BuildContext context) {
    playingBloc.fetchPlayingMovies();
    return Scaffold(
      appBar: CustomAppBar().customAppBar('Vision Movies'),
      backgroundColor: ColorItems.scaffoldColor,
      body: _movieListPage(),
    );
  }
}

Widget _movieListPage() {
    return StreamBuilder(
      stream: playingBloc.nowPlayingAllMovies,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.results.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
          color: ColorItems.cardColor,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                _customClipImage(snapshot, index),
                const SizedBox(width: 15),
                customCardContext(context, snapshot, index)
              ],
            ),
          ),
        );
      },
    );
  }

  ClipRRect _customClipImage(AsyncSnapshot<ItemModel> snapshot, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        'https://image.tmdb.org/t/p/w185${snapshot.data?.results[index].poster_path}',
        fit: BoxFit.cover,
        height: 150,
        width: 100,
      ),
    );
  }

  Expanded customCardContext(BuildContext context, AsyncSnapshot<ItemModel> snapshot, int index) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            snapshot.data?.results[index].title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            snapshot.data?.results[index].overview ?? '',
            style: const TextStyle(color: Colors.white),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieDetails(snapshot: snapshot, index: index)),
                );
              },
              icon: const Icon(Icons.navigate_next_rounded),
            ),
          ),
        ],
      ),
    );
  }