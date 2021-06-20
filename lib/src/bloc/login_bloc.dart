


import 'dart:async';

class LoginBloc {

  final _emailController    = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // Recuperar a saida da Stream 
 Stream<String> get emailStream    => _emailController.stream;
 Stream<String> get passwordStream => _passwordController.stream;

   // Inserir valores na Stream
  Function(String) get changeEmail      =>  _emailController.sink.add;
  Function(String) get changePassword   =>  _passwordController.sink.add;



  @override
  void dispose() { 
    _emailController?.close();
    _passwordController?.close();
  }


}