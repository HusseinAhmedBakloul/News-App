import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signup/Models/ArticalModel.dart';
import 'package:signup/views/trendingview.dart';

class Trendingnews extends StatelessWidget {
  final List<Articalmodel> articles;

  Trendingnews({required this.articles});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 30),
        child: Center(
          child: CircularProgressIndicator(color: Color.fromARGB(255, 218, 183, 27),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return TrendingNewsItem(
              url: articles[index].url!,
              imageUrl: articles[index].urlToImage!,
              title: articles[index].title!,
              desc: articles[index].description!,
            );
          },
        ),
      );
    }
  }
}

class TrendingNewsItem extends StatelessWidget {
  final String imageUrl, title, desc, url;

  TrendingNewsItem({required this.imageUrl, required this.title, required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Trendingview(trending: url)));
        },
        child: Container(
          height: 145,
          width: double.infinity,
          decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(178, 158, 158, 158)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
         ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      'Images/Screenshot 2024-06-28 185545.png',
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5), 
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      title, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w900,
                    ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                      Text(
                      desc,
                      style: const TextStyle(color: Colors.grey, fontSize: 11.5, fontWeight: FontWeight.bold,
                    ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                   ],
                 ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
