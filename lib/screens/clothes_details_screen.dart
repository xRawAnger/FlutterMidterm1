import 'package:flutter/material.dart';
import 'package:midterm1/data/models/clothes_model.dart';
import 'package:midterm1/data/repository/clothes_helper.dart';

class ClothesDetailsScreen extends StatelessWidget {
  static const routeName = "/details-screen";
  @override
  Widget build(BuildContext context) {
    final Clothes cloth = ModalRoute.of(context).settings.arguments as Clothes;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        actions:<Widget> [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){
                ClothesRepository().RemoveClothes(cloth.id);
                Navigator.pop(context);},
              icon: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                  child: FadeInImage(
                    placeholder: AssetImage("assets/images/clothes_placeholder.png"),
                    image: NetworkImage(cloth.imageUrl),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 400,
                  ),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Name"),
                      Text("Price"),
                      Text("Size"),],
                  ),
                  Column(
                    children: [
                      Text(cloth.name),
                      Text(cloth.price.toString()),
                      Text(cloth.size),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text(cloth.description)
            ],
          ),
        ),
      ),
    );
  }
}
