import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signup/Models/ShowCategoryModel.dart';
import 'package:signup/Services/NewsCategory.dart';
import 'package:signup/views/CategoriesView.dart';


class Categoriesnews extends StatefulWidget {
  final String name;

  Categoriesnews({required this.name});

  @override
  State<Categoriesnews> createState() => _CategoriesnewsState();
}

class _CategoriesnewsState extends State<Categoriesnews> {
  late Future<void> _newsFuture;
  List<Showcategorymodel> categories = [];

  Future<void> getNews() async {
    ShowCategoriesNews showCategoriesNews = ShowCategoriesNews();
    await showCategoriesNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoriesNews.categories;
  }

  @override
  void initState() {
    super.initState();
    _newsFuture = getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
          title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: const TextStyle(color: Color.fromARGB(255, 76, 172, 175), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
              ),
            ),
      const Text(
            'News',
             style: TextStyle(color: Color.fromARGB(255, 218, 183, 27), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
           ),
         ),
        ],
      ),
    ),
      body: FutureBuilder<void>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Check your internet connection, Please'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _newsFuture = getNews();
                      });
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (categories.isEmpty) {
            return Center(child: Text('Check your internet Connection, please.'));
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ShowCategory(
                    url: categories[index].url!,
                    image: categories[index].urlToImage ?? 'Images/Screenshot 2024-06-28 185545.png',
                    title: categories[index].title!,
                    desc: categories[index].description!,
                    name: widget.name,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class ShowCategory extends StatelessWidget {
  final String image, title, desc, url, name;

  ShowCategory({required this.image, required this.title, required this.desc, required this.url, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Categoriesview(category: url, name: name)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                height: 170,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset('Images/Screenshot 2024-06-28 185545.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3),
                  Text(
                    desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
