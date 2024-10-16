import 'package:flutter/material.dart';
import 'package:sm_project/src/ui/widgets/app_bar_widget.dart';

class SearchingPage extends StatefulWidget {
  const SearchingPage({super.key});

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().customAppBar('Search Movie'),
      backgroundColor: Colors.transparent,
      body: const Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: SearchBar(hintText: 'Search',),
          ),
        ],
      ),
    );
  }
}