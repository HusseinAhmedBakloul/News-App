import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:signup/Models/ShowCategoryModel.dart';

class ShowCategoriesNews {
  List<Showcategorymodel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f44017c1cb7d4493ac695124ccf93faa";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["status"] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element["urlToImage"] != null && element["description"] != null) {
              Showcategorymodel showcategorymodel = Showcategorymodel(
                title: element["title"],
                description: element["description"],
                url: element["url"],
                urlToImage: element["urlToImage"],
                content: element["content"],
                author: element["author"]
              );
              categories.add(showcategorymodel);
            }
          });
        }     
      }
    }
  }
 
