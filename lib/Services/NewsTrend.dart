import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:signup/Models/ArticalModel.dart';

class News {
  List<Articalmodel> news = [];
  
  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/everything?q=apple&from=2024-08-02&to=2024-08-02&sortBy=popularity&apiKey=f44017c1cb7d4493ac695124ccf93faa";
    var responce = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(responce.body);

    if (jsonData["status"]=="ok") {
      jsonData["articles"].forEach((element){
      if (element["urlToImage"]!=null && element["description"]!= null){
        Articalmodel articalmodel = Articalmodel(
          title: element["title"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"],
          author: element["author"]
        );
        news.add(articalmodel);
      }
      }
      );
    }
  }
}