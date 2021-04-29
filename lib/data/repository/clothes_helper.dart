import 'package:midterm1/data/models/clothes_model.dart';
import 'package:midterm1/data/models/dummy_data.dart';

class ClothesRepository {
  // ignore: non_constant_identifier_names
  void AddClothes(Clothes clothes){
    DUMMY_DATA.add(clothes);
  }

  // ignore: non_constant_identifier_names
  RemoveClothes(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  // ignore: non_constant_identifier_names
  void EditClothes(Clothes clothes, int index) {
    DUMMY_DATA.replaceRange(index, index +1, [clothes]);
  }
}