import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:validation/src/models/product-model.dart';
import 'package:http/http.dart' as http;

class ProductManager {

  final String _url = 'https://fir-varios-default-rtdb.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    
    final url = '$_url/products.json';

    final response = await http.post(url, body: productModelToJson(product));

    final decodedData = json.decode(response.body);

    print(decodedData);
    
    return true;
  }
 
 //Carregar todos produtos do firebase
 Future<List<ProductModel>> loadingProducts() async {
    
     final url = '$_url/products.json'; 
     final response = await http.get(url);

     final decodedData = json.decode(response.body);
     
     print(decodedData); 

     return [];
 }

}
