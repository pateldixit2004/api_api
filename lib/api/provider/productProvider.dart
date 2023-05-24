import 'dart:convert';

import 'package:api_api/api/modal/productModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ProductProvider extends ChangeNotifier
{
  List<dynamic> productList=[];
  Future<void> api()
  async {
    String link='https://fakestoreapi.com/products';
    var responce=await http.get(Uri.parse(link));
    var json=jsonDecode(responce.body);
    productList=json.map((e)=>ProductModal.fromJson(e)).toList();
    notifyListeners();
    // print(responce.body);
  }
}