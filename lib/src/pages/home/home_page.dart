import 'package:flutter/material.dart';
import 'package:validation/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(),
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
}
