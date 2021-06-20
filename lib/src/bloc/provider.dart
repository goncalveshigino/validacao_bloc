import 'package:flutter/material.dart';

import 'login_bloc.dart';
export 'login_bloc.dart';

class Provider extends InheritedWidget {

  static Provider _instancia;


 //Aqui precisamos saber se e necessario retornar uma nova instancia ou reutizar a antiga
  factory Provider({Key key, Widget child}) {
     
     if(_instancia == null){
       _instancia = new Provider._internal(key: key, child: child,);
     }

     return _instancia;
  }

   Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        .loginBloc;
  }
}
