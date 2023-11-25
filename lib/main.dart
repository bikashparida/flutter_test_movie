import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_movie/constant.dart';
import 'package:flutter_test_movie/features/home_screen/page/home_screen.dart';
import 'package:flutter_test_movie/features/home_screen/provider/movie_provider.dart';
import 'package:flutter_test_movie/features/search_screen/page/search_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    HomePage(),
    SearchScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieProvider>(
            create: (context) => MovieProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kBackGroundColor,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: kBackGroundColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            body: _pages.elementAt(_selectedIndex),
          ),
        ),
      ),
    );
  }
}
