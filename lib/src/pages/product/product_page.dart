import 'package:flutter/material.dart';
import 'package:validation/src/models/product-model.dart';
import 'package:validation/src/providers/product-manager.dart';
import 'package:validation/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

final formKey = GlobalKey<FormState>();

ProductModel product = new ProductModel();
final productManager = new ProductManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _createName(),
                _createPrice(),
                //_createAvailable(),
                SizedBox(
                  height: 20.0,
                ),
                _createButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _createName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Produto',
      ),
       onSaved: (value) => product.title = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Insiea o nome do produto';
        } else {
          return null;
        }
      },
    );
  }

  _createPrice() {
    return TextFormField(
        initialValue: product.price.toString(),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: 'Preco',
        ),
        onSaved: (value) => product.price = double.parse(value),
        validator: (value) {
          if (utils.isNumeric(value)) {
            return null;
          } else {
            return 'Somente numero';
          }
        },
    );
  }

  _createAvailable(){
     
    // final available = Provider.of<ProductManager>(context);
   
    return SwitchListTile(
      value: product.available,
      title: Text('Disponivel'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => 
      setState((){
        product.available = value;
      }),
    );
  }

  _createButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );
  }

  void _submit() {


    if(! formKey.currentState.validate() ) return;

    formKey.currentState.save();

     print('Todo Ok');
     print( product.title);
     print( product.price);
     print( product.available); 

     
    productManager.createProduct(product);

  }
}
