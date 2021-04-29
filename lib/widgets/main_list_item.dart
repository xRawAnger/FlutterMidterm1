import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;

  const MainListItem({
    this.imageUrl,
    this.name,
    this.price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                placeholder: AssetImage("assets/images/clothes_placeholder.png"),
                image: NetworkImage(imageUrl),
                width: double.infinity,
                fit: BoxFit.cover,
                height: 130,
              ),

            ),
            Text(name),
            Text(price.toString()),
          ],
        ),
      ),
    );
  }
}
