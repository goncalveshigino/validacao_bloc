import 'package:flutter/material.dart';
import 'package:validation/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

final formKey = GlobalKey<FormState>();

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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Produto',
      ),
      validator: (value) {
        if (value.length < 3) {
          return 'Insiea o nome do produto';
        } else {
          return null;
        }
      },
     // onSaved: (product) => product = product,
    );
  }

  _createPrice() {
    return TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: 'Preco',
        ),
        validator: (value) {
          if (utils.isNumeric(value)) {
            return null;
          } else {
            return 'Somente numero';
          }
        },
       // onSaved: (price) => price = price,
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


    if(! formKey.currentState.validate()) return;
     print('Todo Ok');
  

  }
}
