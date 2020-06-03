import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{

  static const String ID = "id";
  static const String DESCRIPTION = "description";
  static const String PRODUCT_ID = "productId";
  static const String AMOUNT = "amount";
  static const String STATUS = "status";
  static const String USER_ID = "userId";
  static const String PURCHASED_AT = "purchasedAt";


  String _id;
  String _description;
  String _productId;
  int _amount;
  String _status;
  String _userId;
  int _purchasedAt;


  //getters

  String get id => _id;

  String get description => _description;

  String get productId => _productId;

  int get amount => _amount;

  String get status => _status;

  String get userId => _userId;

  int get purchasedAt => _purchasedAt;


  OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _productId = snapshot.data[PRODUCT_ID];
    _description = snapshot.data[DESCRIPTION];
    _amount = snapshot.data[AMOUNT];
    _status = snapshot.data[STATUS];
    _userId = snapshot.data[USER_ID];
    _purchasedAt = snapshot.data[PURCHASED_AT];


  }

}