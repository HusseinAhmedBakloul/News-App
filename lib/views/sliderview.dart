import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Sliderview extends StatefulWidget {
  
  final String breaking;
  Sliderview({required this.breaking});

  @override
  _SliderviewState createState() => _SliderviewState();
}

class _SliderviewState extends State<Sliderview> {

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
          'Breaking', style: TextStyle(color: Color.fromARGB(255, 76, 172, 175), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
          ),
        ),
          Text(
          'News', style: TextStyle(color: Color.fromARGB(255, 218, 183, 27), fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Oswald',
          ),
        ),
      ],
    ),
  ),
      body: Container(
            child: WebViewWidget(controller: WebViewController()..loadRequest(Uri.parse(widget.breaking))    
      ),
    ),
   );
  }
}
