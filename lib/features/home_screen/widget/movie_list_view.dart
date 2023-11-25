import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_movie/data/model/movie_model.dart';
import 'package:flutter_test_movie/features/details_screen/page/details_screen.dart';
import 'package:flutter_test_movie/features/home_screen/widget/text_widget.dart';
import '../../../constant.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key, required this.notifier, required this.type});

  final dynamic notifier;
  final String type;
  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    List<MovieModel> dataList = [];
    if (widget.type == 'movie') {
      dataList = widget.notifier.movieData;
    } else if (widget.type == 'search') {
      dataList = widget.notifier.searchMoviedata;
    }
    return SingleChildScrollView(
      child: ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final data = dataList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(selectedMovie: data),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 10.w, right: 5.w, top: 5.h, bottom: 5.h),
                  height: height * 0.130.h,
                  width: width * 1.w,
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.30.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(data.show?.image?.medium ??
                                    'https://img.freepik.com/premium-vector/movie-theater-signboard-blue_34230-295.jpg'))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.50,
                              child: TextWidget(
                                text: data.show?.name ?? '',
                                fontSize: 15.sp,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width * 0.50,
                                  child: TextWidget(
                                    text: data.show?.summary ?? '',
                                    fontSize: 11.sp,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.55,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text:
                                            'Language- ${data.show?.language ?? ''}',
                                        fontSize: 11.sp,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  color: Colors.white,
                  height: 0.20.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
