import 'package:flutter/material.dart';
import 'package:validation/src/bloc/provider.dart';
import 'package:validation/src/models/product-model.dart';
import 'package:validation/src/providers/product-manager.dart';

class HomePage extends StatelessWidget { 

    final productManager = new ProductManager();

  @override
  Widget build(BuildContext context) {


    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
        centerTitle: true,
      ),
      body: _createList(),
      floatingActionButton: _createButton(context),
    );
  }

  _createButton(BuildContext context) {

    return FloatingActionButton(
      child: Icon( Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'product'),
    );
  }  


  //Criar Lista
  _createList(){


    return FutureBuilder(
      future: productManager.loadingProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot){

        if( snapshot.hasData ){
         
          final products = snapshot.data;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context,i) => _createItem( context, products[i] ),
          );

        }else{

          return Center(
            child: CircularProgressIndicator(),
          );

        }

      }
    );
  }

  _createItem( BuildContext context, ProductModel product){
    
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.redAccent
      ),
      onDismissed: ( diracao ){
        // TODO: Apagar producto
      },
      child: ListTile(
         title: Text('${ product.title } - ${ product.price }'),
         subtitle: Text( product.id ),
         onTap: () => Navigator.pushNamed( context, 'product')
      ),
    );

  }

}
