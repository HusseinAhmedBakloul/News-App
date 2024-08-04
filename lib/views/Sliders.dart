import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:signup/Models/SliderModel.dart';
import 'package:signup/views/sliderview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Sliders extends StatefulWidget {
  final List<Slidermodel> sliders;

  Sliders({required this.sliders});

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.sliders.isEmpty)
          Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 231, 194, 30), ),
        )
        else
          CarouselSlider.builder(
            itemCount: widget.sliders.length,
            itemBuilder: (context, index, realIndex) {
              String? url = widget.sliders[index].url; 
              String? image = widget.sliders[index].urlToImage;
              String? name = widget.sliders[index].title;
              return buildImage(image!, index, name!, url!);
            },
            options: CarouselOptions(
              height: 250,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
        SizedBox(height: 20),
        buildIndicator(),
      ],
    );
  }

  Widget buildImage(String image, int index, String name, String url) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Sliderview(breaking: url)),
              );
            },
            child: Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            left: 10,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.sliders.length,
        effect: ScrollingDotsEffect(
          activeDotColor: Color.fromARGB(255, 231, 194, 30),
          dotColor: Color.fromARGB(255, 76, 172, 175),
          dotHeight: 12,
          dotWidth: 12,
        ),
      );
}
