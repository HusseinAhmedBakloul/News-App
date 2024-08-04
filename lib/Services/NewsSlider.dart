import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:signup/Models/SliderModel.dart';

class SliderService {
  List<Slidermodel> sliders = [];
  
  Future<void> getSlider() async {
    String url ="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f44017c1cb7d4493ac695124ccf93faa";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["status"] == "ok") {
          List<dynamic> articles = jsonData["articles"];
          articles.forEach((element) {
            if (element["urlToImage"] != null && element["description"] != null) {
              Slidermodel slidermodel = Slidermodel(
                title: element["title"],
                description: element["description"],
                url: element["url"],
                urlToImage: element["urlToImage"],
                content: element["content"],
                author: element["author"],
              );
              sliders.add(slidermodel);
            }
          });
        } 
      }
    } 
  }

