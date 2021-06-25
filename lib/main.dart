import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validation/src/bloc/provider.dart';
import 'package:validation/src/pages/home/home_page.dart';
import 'package:validation/src/pages/login/login_page.dart';
import 'package:validation/src/pages/product/product_page.dart';
import 'package:validation/src/providers/product-manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: _MaterialWithInherited());
  }
}

class _MaterialWithInherited extends StatelessWidget {
  const _MaterialWithInherited({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'login':   (BuildContext context) => LoginPage(),
        'home':    (BuildContext context) => HomePage(),
        'product': (BuildContext context) => ProductPage()
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}
