import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Categoriesview extends StatefulWidget {
  final String category;
  final String name;

  Categoriesview({required this.category, required this.name});

  @override
  _CategoriesviewState createState() => _CategoriesviewState();
}

class _CategoriesviewState extends State<Categoriesview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: Container(
            child: WebViewWidget(controller: WebViewController()..loadRequest(Uri.parse(widget.category))    
      ),
    ),
    );
  }
}
