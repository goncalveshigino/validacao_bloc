import 'package:flutter/material.dart';
import 'package:validation/src/bloc/provider.dart';
import 'package:validation/src/pages/home/home_page.dart';
import 'package:validation/src/pages/login/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: _MaterialWithInherited()
    );
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
     initialRoute: 'login',
     routes: {
       'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage()
     },
    );
  }
}