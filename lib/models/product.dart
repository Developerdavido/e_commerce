 import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  // constants
  static const String BRAND = "brand";
  static const String CATEGORIES = "category";
  static const String COLORS = "colors";
  static const String FEATURED = "featured";
  static const String ID = "id";
  static const String NAME = "name";
  static const String PICTURE = "picture";
  static const String PRICE = "price";
  static const String QUANTITY = "quantity";
  static const String SALE = "sale";
  static const String SIZES = "sizes";
  static const RATES = "rates";


  //private variables
String _brand;
String _category;
String _id;
String _name;
String _picture;
int _price;
int _quantity;
List<String> _colors;
List<String> _size;
bool _featured;
bool _sale;
int _rates;

  String get brand => _brand;

  String get category => _category;

  String get id => _id;

  String get name => _name;

  String get picture => _picture;

  int get price => _price;

  int get quantity => _quantity;

  List<String> get colors => _colors;

  List<String> get size => _size;

  bool get featured => _featured;

  bool get sale => _sale;
  int get rates => _rates;

  Product.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data;
    _featured = data[FEATURED];
    _brand = data[BRAND];
    _category = data[CATEGORIES];
    _id = data[ID];
    _name = data[NAME];
    _picture = data[PICTURE];
    _price = data[PRICE];
    _colors = data[COLORS];
    _size = data[SIZES];
    _sale = data[SALE];
    _quantity = data[QUANTITY];
    _rates = data[RATES];
  }



}