import 'package:flutter/material.dart';
import 'package:midterm1/data/models/clothes_model.dart';
import 'package:midterm1/data/repository/clothes_helper.dart';

// ignore: must_be_immutable
class EditDetailsScreen extends StatefulWidget {
  static const routeName = "/edit-screen";

  @override
  _EditDetailsScreenState createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController clothID;
  TextEditingController clothName;
  TextEditingController clothImageUrl;
  TextEditingController clothSize;
  TextEditingController clothPrice;
  TextEditingController clothDescription;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context).settings.arguments as Map;
    final Clothes cloth = parsedData["cloth"];
    final int index = parsedData["index"];

    clothID = TextEditingController(text: cloth.id.toString());
    clothName = TextEditingController(text: cloth.name);
    clothImageUrl = TextEditingController(text: cloth.imageUrl);
    clothSize = TextEditingController(text: cloth.size);
    clothPrice = TextEditingController(text: cloth.price.toString());
    clothDescription = TextEditingController(text: cloth.description);


    return Scaffold(
      appBar: AppBar(
        title: Text("edit"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 40,left: 40,top: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: clothID,
                    decoration: InputDecoration(hintText: "enter ID"),
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "enter ID";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothName,
                    decoration: InputDecoration(hintText: "enter name"),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "enter name";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothImageUrl,
                    decoration: InputDecoration(hintText: "enter image Url"),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "enter image Url";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothSize,
                    decoration: InputDecoration(hintText: "enter size"),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "enter size";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothPrice,
                    decoration: InputDecoration(hintText: "enter price"),
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "enter price";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothDescription,
                    decoration: InputDecoration(hintText: "enter description"),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "enter description";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child:Text("Back") ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()){
                          Clothes cloth = Clothes(
                              id: int.tryParse(clothID.text),
                              name: clothName.text,
                              imageUrl: clothImageUrl.text,
                              size: clothSize.text,
                              price: double.tryParse(clothPrice.text),
                              description: clothDescription.text
                          );
                          ClothesRepository().EditClothes(cloth,index);
                        }
                      } ,
                      child: Text("edit"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
