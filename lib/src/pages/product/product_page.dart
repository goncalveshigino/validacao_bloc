import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
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
            child: Column(
              children: [
                _createName(),
                _createPrice(), 
                SizedBox(height: 20.0,),
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
     validator: (value){
       if ( value.length < 3){
         return 'Insiea o nome do produto';
       } else {
         return null;
       }
     },
    );
  }

  _createPrice() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Preco',
      ),
      validator: (value){
         

         
     }
    );
  }

  _createButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon:  Icon( Icons.save),
      onPressed: (){},
    );
  }
}
