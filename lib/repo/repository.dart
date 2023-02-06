import "dart:convert";

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc_restapi_firebase/model/product_model.dart';

class ProductRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("users");
  // get data
  Future<List<ProductModel>> get() async {
    List<ProductModel> productList = [];
    try {
      final pro = await _fireCloud.get();
      pro.docs.forEach((element) {
        productList.add(ProductModel.fromJson(element.data()));
      });
      return productList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("lỗi: '${e.code}': ${e.message}");
      }
      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
