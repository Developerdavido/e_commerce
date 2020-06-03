import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const ADDRESS = "address";
  static const PHONE = "phone";


  String _name;
  String _email;
  String _id;
  String _address;
  String _phone;


  //getters
  String get name => _name;

  String get email => _email;

  String get id => _id;

  String get phone => _phone;

  String get address => _address;



  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _address = snapshot.data[ADDRESS];
    _phone = snapshot.data[PHONE];

  }




}