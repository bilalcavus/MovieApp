import 'package:flutter/material.dart';
import 'package:sm_project/src/models/item_model.dart';

class MovieDetails extends StatefulWidget {
  final AsyncSnapshot<ItemModel>? snapshot; // Nullable yapıldı
  final int? index; // Nullable yapıldı

  const MovieDetails({super.key, this.snapshot, this.index});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Scaffold arka planını şeffaf yap
      appBar: AppBar(
        backgroundColor:   Color.fromARGB(255, 13, 11, 40),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Movie Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            },
          icon: const Icon(Icons.arrow_back))),
      
      body: Container(
        decoration: boxDecAllContainer(),
        child: Column(
          children: [
            UpperContainer(widget: widget), //üst kısımdaki film detayları
             const SizedBox(height: 15),
             customDivider(),
            FilmDetailsUnder(widget: widget), // Alt kısımdaki film detayları
          ],
        ),
      ),
    );
  }



  BoxDecoration boxDecAllContainer() {
    return const BoxDecoration(
        gradient: LinearGradient(
          colors: [
          
            Color(0xff050234),
            Color.fromARGB(255, 6, 0, 0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );
  }
}





class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
    required this.widget,
  });

  final MovieDetails widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: boxWidthHeight(),
      color: Colors.transparent, // Yukarıdaki container'ın rengi şeffaf
      child: widget.snapshot != null && widget.index != null
          ? FilmDetails(widget: widget)
          : const Center(
          child: Text(
            'No movie data available',
            style: TextStyle(color: Colors.white),
          ),
        ),
    );
  }

  BoxConstraints boxWidthHeight() {
    return const BoxConstraints(
      maxHeight: 280,
      maxWidth: 500,
    );
  }
}

class FilmDetails extends StatelessWidget {
  const FilmDetails({
    super.key,
    required this.widget,
  });

  final MovieDetails widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Resim
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              height: 250,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              'https://image.tmdb.org/t/p/w185${widget.snapshot?.data?.results[widget.index!].poster_path}',
            ),
          ),
          const SizedBox(width: 20), // Resim ile açıklama arasına boşluk ekler
          // Açıklama
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.snapshot?.data?.results[widget.index!].title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      widget.snapshot?.data?.results[widget.index!].overview ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Alt kısımdaki film detayları
class FilmDetailsUnder extends StatefulWidget {
  const FilmDetailsUnder({
    super.key,
    required this.widget,
  });

  final MovieDetails widget;

  @override
  State<FilmDetailsUnder> createState() => _FilmDetailsUnderState();
}

class _FilmDetailsUnderState extends State<FilmDetailsUnder> {
  bool isFavourite = false;
  void _isLiked (){
    setState(() {
      isFavourite=!isFavourite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               //SCORE
                Padding( 
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Column(
                    children: [
                      const Icon(Icons.star),
                      const Text('Score', style: TextStyle(fontSize: 15)),
                      Text(
                        (widget.widget.snapshot?.data?.results[widget.widget.index!].vote_average ?? '' ).toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ), 
                //RELEASE DATE
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Icon(Icons.date_range),
                      const Text('Release Year', style: TextStyle(fontSize: 15)),
                      Text(
                        _getYearFromReleaseDate(widget.widget.snapshot?.data?.results[widget.widget.index!].release_date),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                //LIKE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                         _isLiked();
                        },
                        icon:  Icon(Icons.favorite, size: 26, color: isFavourite ? Colors.red : Colors.white),
                        iconSize: 26,
                      ),
                    ],
                  ),
                ),
              ], 
            ),
            customDivider(),  
          ],
        ),
      ),
    );
  }

  String _getYearFromReleaseDate(String? releaseDate) {
    if (releaseDate != null && releaseDate.isNotEmpty) {
      try {
        final DateTime date = DateTime.parse(releaseDate);
        return date.year.toString();
      } catch (e) {
        return '';
      }
    }
    return '';
  }
}


  Divider customDivider() {
    return const Divider( // İnce bir çizgi ekliyoruz
            height: 1, // Çizginin yüksekliği
            thickness:0.4, // Çizginin kalınlığı
            color: Colors.white, // Çizginin rengi
          );
  }