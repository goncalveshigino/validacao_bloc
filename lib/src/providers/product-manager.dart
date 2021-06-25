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

     final Map<String, dynamic> decodedData = json.decode(response.body);
     final List<ProductModel> products = new List();
     
     //Se nao existir dados no banco retorna nulo
     if( decodedData == null ) return []; 

     decodedData.forEach( (id, prod){

       final prodTemp = ProductModel.fromJson(prod);
       prodTemp.id = id;
         
       products.add( prodTemp );

     });

     return products;
 }

}
