import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_movie/data/model/movie_model.dart';
import '../../../constant.dart';
import '../../home_screen/widget/text_widget.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel selectedMovie;
  const DetailsScreen({Key? key, required this.selectedMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: height * 0.35,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: height * 0.35,
                    width: width,
                    child: Image.network(
                      selectedMovie.show?.image?.original ??
                          'https://img.freepik.com/premium-vector/movie-theater-signboard-blue_34230-295.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: TextWidget(
                    text: selectedMovie.show?.name ?? '',
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Flexible(
                  child: TextWidget(
                    text: selectedMovie.show?.summary ?? '',
                    fontSize: 11.sp,
                    maxLines: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
