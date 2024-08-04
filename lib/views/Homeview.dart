import 'package:flutter/material.dart';
import 'package:signup/Models/ArticalModel.dart';
import 'package:signup/Models/SliderModel.dart';
import 'package:signup/Services/NewsSlider.dart';
import 'package:signup/Services/NewsTrend.dart';
import 'package:signup/views/Categories.dart';
import 'package:signup/views/PersonalPage.dart';
import 'package:signup/views/Sliders.dart';
import 'package:signup/views/TrendingNews.dart';



class HalfClippedRectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(
      size.width / 6,
      size.height - (size.height / 2),
      3 * (size.width / 2),
      size.height,
      size.width,
      size.height - (size.height / 1),
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; 
  }
}

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  late Future<void> _newsFuture;
  List<Articalmodel> articles = [];
  late Future<void> _slidersFuture;
  List<Slidermodel> sliders = [];

  @override
  void initState() {
    super.initState();
    _newsFuture = getNews();
    _slidersFuture = getSliders();     

 
  }

  Future<void> getNews() async {
    try {
      News newsclass = News();
      await newsclass.getNews();
      setState(() {
        articles = newsclass.news;
      });
    } catch (e) {
      print('Error fetching news: $e');
    }
  }

  Future<void> getSliders() async {
    try {
      SliderService sliderService = SliderService();
      await sliderService.getSlider();
      setState(() {
        sliders = sliderService.sliders;
      });
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 172, 175),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonalPage()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.account_circle_rounded, size: 32, color: Color.fromARGB(255, 218, 183, 27),
            ),
          ),
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
            'News', style: TextStyle(color: Color.fromARGB(255, 76, 172, 175), fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
              ),
            ),
            Text(
            'Today', style: TextStyle(color: Color.fromARGB(255, 218, 183, 27), fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
            ),
          ),
        ],
       ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: HalfClippedRectClipper(),
            child: Container(
              color: Colors.white,
              height: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Categories(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Row(
                    children: [
                      Text(
                      'Breaking', style: TextStyle(color: Color.fromARGB(255, 218, 183, 27), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
                      ),
                     ),
                      Text(
                      'News?', style: TextStyle(color: Color.fromARGB(255, 76, 172, 175), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
                        ),
                      ),
                    ],
                  ),
                ),
                Sliders(sliders: sliders), 
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      Text(
                     'Trending', style: TextStyle(color: Color.fromARGB(255, 218, 183, 27), fontSize: 20, fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                        ),
                      ),
                      Text(
                      'News?', style: TextStyle(color: Color.fromARGB(255, 76, 172, 175), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
                      ),
                    ),
                  ],
                ),
              ),
              Trendingnews(articles: articles),
            ],
          ),
        ),
      ],
    ),
  );
 }
}
