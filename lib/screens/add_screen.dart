
import 'package:flutter/material.dart';
import 'package:midterm1/data/models/clothes_model.dart';
import 'package:midterm1/data/repository/clothes_helper.dart';

class AddScreen extends StatelessWidget {
  static const routeName = "/add-screen";
  final _formKey = GlobalKey<FormState>();


  TextEditingController clothID = TextEditingController();
  TextEditingController clothName = TextEditingController();
  TextEditingController clothImageUrl = TextEditingController();
  TextEditingController clothSize = TextEditingController();
  TextEditingController clothPrice = TextEditingController();
  TextEditingController clothDescription = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
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
                            Clothes clothes = Clothes(
                              id: int.tryParse(clothID.text),
                              name: clothName.text,
                              imageUrl: clothImageUrl.text,
                              size: clothSize.text,
                              price: double.tryParse(clothPrice.text),
                              description: clothDescription.text
                            );
                            ClothesRepository().AddClothes(clothes);
                            Navigator.pop(context);
                          }
                       } ,
                        child: Text("Add"),
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
