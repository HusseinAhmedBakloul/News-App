import 'package:flutter/material.dart';
import 'package:signup/views/Homeview.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Image.asset(
                  'Images/Screenshot 2024-07-01 192910.png', 
                  fit: BoxFit.fitWidth,
                  height: 350,
                  width: 350,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 30),
                child: Text(
                  'Stay up to date with the latest global news exclusive to you.',
                  style: TextStyle(color: Color.fromARGB(255, 76, 172, 175), fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 105, right: 20),
                child: Text(
                  'Our app brings you breaking news and exclusive reports from around the world.',
                  style: TextStyle(color: Color.fromARGB(195, 158, 158, 158), fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 228, 190, 23),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(double.infinity, 60), 
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Homeview()),
                    );
                  },
                  child: const Text('Get Started',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
