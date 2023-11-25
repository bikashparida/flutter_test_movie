import 'package:flutter/material.dart';
import 'package:flutter_test_movie/features/home_screen/provider/movie_provider.dart';
import 'package:flutter_test_movie/features/home_screen/widget/movie_list_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).getMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: true,
      ),
      body: Consumer<MovieProvider>(
        builder: (context, value, child) {
          if (value.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return MovieListView(
            notifier: value,
            type: 'movie',
          );
        },
      ),
    );
  }
}
