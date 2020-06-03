import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';

class UserServices{
    Firestore _firestore  = Firestore.instance;
    String collection ="users";

    void createUser(Map<String, dynamic> values){
     _firestore.collection(collection).document(values["id"]).setData(values);
    }
    
    void UpdateUserData(Map<String, dynamic> values) {
      _firestore.collection(collection).document(values["id"]).updateData(values);
    }

    Future<UserModel> getUserById(String id) => _firestore.collection(collection).document(id).get().then((doc) => UserModel.fromSnapshot(doc));

}