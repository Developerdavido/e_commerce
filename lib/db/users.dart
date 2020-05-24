import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserServices{
    Firestore firestore  = Firestore.instance;
    String collection ="users";

    void createUser(Map data){
     firestore.collection(collection).document(data["userId"]).setData(data);
    }
}