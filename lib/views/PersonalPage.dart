import 'package:flutter/material.dart';
import 'package:signup/login/WelcomeScreen.dart';
import 'package:signup/views/Homeview.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
          title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
            'Personal',
            style: TextStyle(color: Color.fromARGB(255, 76, 172, 175), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
         ),
       ),
            Text(
            'Page',
             style: TextStyle(color: Color.fromARGB(255, 218, 183, 27), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Oswald',
           ),
         ),
        ],
      ),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
           children: [
                  Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40, top: 400),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 228, 190, 23),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    onPressed: () {

                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()), 
                 );
                },
                   child: const Text('Log Out', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                ),
             ]),
      )
    ),
   );
  }
}