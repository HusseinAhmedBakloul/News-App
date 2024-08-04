import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Trendingview extends StatefulWidget {
  
  final String trending;
  Trendingview({required this.trending});

  @override
  _TrendingviewState createState() => _TrendingviewState();
}

class _TrendingviewState extends State<Trendingview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
            'Trending', style: TextStyle(color: Color.fromARGB(255, 76, 172, 175), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
            ),
           ),
            Text(
            'News', style: TextStyle(color: Color.fromARGB(255, 218, 183, 27), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
            ),
           ),
          ],
        ),
      ),
      body: Container(
            child: WebViewWidget(controller: WebViewController()..loadRequest(Uri.parse(widget.trending))    
      ),
    ),
    );
  }
}
