import 'package:cloud_firestore/cloud_firestore.dart';


class ShopModel{
  static const ID = "id";
  static const NAME = "name";
  static const PRICE = "price";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const RATING = "rating";
  static const RATES = "rates";

  String _id;
  String _name;
  String _image;
  double _price;
  double _rating;
  bool _popular;
  int _rates;

  //getters
  String get id => _id;

  String get name => _name;

  String get image => _image;

  double get price => _price;

  double get rating => _rating;

  bool get popular => _popular;

  int get rates => _rates;

  ShopModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _price = snapshot.data[PRICE];
    _rating = snapshot.data[RATING];
    _popular = snapshot.data[POPULAR];
    _rates = snapshot.data[RATES];
  }

}