import 'package:flutter/material.dart';
import 'package:midterm1/data/models/clothes_model.dart';
import 'package:midterm1/data/models/dummy_data.dart';
import 'package:midterm1/screens/edit_details_screen.dart';
import 'package:midterm1/widgets/main_list_item.dart';

import 'add_screen.dart';
import 'clothes_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  List<Clothes> clothesList = DUMMY_DATA;
  static const _title = "midterm1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,

      ),
      body: GridView.builder(
          itemCount: clothesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
          itemBuilder: (BuildContext ctx, index){
            var cloth = clothesList[index];
            return Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: ()  => Navigator.pushNamed(context, ClothesDetailsScreen.routeName, arguments: cloth).then((_) {
                  setState(() {

                  });
                }),
                onLongPress: () => Navigator.pushNamed(context, EditDetailsScreen.routeName, arguments: {"cloth": cloth,"index":index}).then((_) {
                  setState(() {

                  });
                } ),
                child: MainListItem(
                  imageUrl: cloth.imageUrl,
                  name: cloth.name,
                  price: cloth.price),
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, AddScreen.routeName).then((_) {
          setState(() {

          });
        }),
      ),
    );
  }
}