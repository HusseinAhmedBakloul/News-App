import 'package:flutter/material.dart';
import 'package:signup/views/CategoriesNews.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Widget categoryTile(String title, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 5),
        height: 110,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child:
         Text(
         title,
         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 255, 255, 255),
        ),
       ),
      ),
     ),
   );
 }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          categoryTile('Business', 'Images/Screenshot 2024-06-28 035356.png', Categoriesnews(name: 'Business')),
          categoryTile('Entertainment', 'Images/Screenshot 2024-06-28 035243.png', Categoriesnews(name: 'Entertainment')),
          categoryTile('General', 'Images/Screenshot 2024-06-28 035204.png', Categoriesnews(name: 'General')),
          categoryTile('Health', 'Images/Screenshot 2024-06-28 035129.png', Categoriesnews(name: 'Health')),
          categoryTile('Science', 'Images/Screenshot 2024-06-28 035032.png', Categoriesnews(name: 'Science')),
          categoryTile('Sports', 'Images/Screenshot 2024-06-28 034906.png', Categoriesnews(name: 'Sports')),
          categoryTile('Technology', 'Images/Screenshot 2024-06-28 034757.png', Categoriesnews(name: 'Technology')),
        ],
      ),
    );
  }
}
