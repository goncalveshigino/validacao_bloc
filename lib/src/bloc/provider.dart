import 'package:flutter/material.dart';

import 'login_bloc.dart';
export 'login_bloc.dart';

class BlocProvider extends InheritedWidget {

  static BlocProvider _instancia;


 //Aqui precisamos saber se e necessario retornar uma nova instancia ou reutizar a antiga
  factory BlocProvider({Key key, Widget child}) {
     
     if(_instancia == null){
       _instancia = new BlocProvider._internal(key: key, child: child,);
     }

     return _instancia;
  }

   BlocProvider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .loginBloc;
  }
}
