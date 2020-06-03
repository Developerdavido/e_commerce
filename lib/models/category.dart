import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  static const String ID = "id";
  static const String NAME = "name";
  static const String IMAGE = "image";


  String _id;
  String _name;
  String _image;

  String get id => _id;

  String get name => _name;

  String get image => _image;

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _image =snapshot.data[IMAGE];
    _name = snapshot.data[NAME];
  }

//getters

}