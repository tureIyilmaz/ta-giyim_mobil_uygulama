import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int indexCategory = 0;

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'Lahmacun',
      'Tatlı',
      'Çorba',
      'Pizza',
      'İçecek',
      'Kebap',
      'Pide',
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexCategory = index;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(
                index == 0 ? 16 : 8,
                0,
                index == list.length - 1 ? 16 : 8,
                0,
              ),
              alignment: Alignment.center,
              child: Text(
                list[index],
                style: TextStyle(
                  fontSize: 16,
                  color: indexCategory == index ? Colors.green : Colors.grey,
                  fontWeight: indexCategory == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
