import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_movie/features/home_screen/provider/movie_provider.dart';
import 'package:flutter_test_movie/features/home_screen/widget/movie_list_view.dart';
import 'package:flutter_test_movie/features/search_screen/widget/search_bar_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SearchBarWidget(),
            ),
            Consumer<MovieProvider>(
              builder: (context, value, child) {
                if (value.isLoading == true) {
                  return Container();
                }
                return MovieListView(
                  notifier: value,
                  type: 'search',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
