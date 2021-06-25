import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validation/src/bloc/provider.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _createBackground( context),
        _loginForm(context),
      ],
    ));
  }


  _loginForm( BuildContext context) {
    
    final bloc =BlocProvider.of(context);
    final size = MediaQuery.of(context).size;

     return SingleChildScrollView(
       child: Column(
         children: [

          SafeArea(
            child: Container(
              height: 160.0,
            ),
          ),


           Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 50.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow> [
                 BoxShadow(
                   color: Colors.black26, 
                   blurRadius: 3.0, 
                   offset: Offset(0.0, 5.0), 
                   spreadRadius: 3.0
                 )
              ]
            ),

            child: Column(
              children: [
                Text('Entrar', style: TextStyle(fontSize:  20.0)),
                SizedBox(height: 30.0,),
                _creatEmail( bloc), 
                SizedBox(height: 30.0,),
                _creatPassword( bloc),
               SizedBox(height: 30.0,),
                _createButton( bloc)
              ],
            ),
           ), 

            TextButton(
              child: Text('Esqueceu a senha', style: TextStyle(color: Colors.deepPurple),),
              onPressed: (){},
            ),

            SizedBox(height: 100.0,)
         ],

       ),
     );
  }

  _creatEmail( LoginBloc bloc ){

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon( Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'Seu email',
              labelText: 'Email', 
              counterText: snapshot.data, 
              errorText: snapshot.error
            ),
            onChanged:  bloc.changeEmail,
          ),
        );

      },
    );

    
  }

  _createButton(LoginBloc bloc){ 


    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: ( BuildContext context, AsyncSnapshot snapshot){

        return RaisedButton(

            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Entrar'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            elevation: 5.0,
            color: Colors.deepPurple,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
        );
      },
    );
  }

  _login( LoginBloc bloc, BuildContext context) {

    print('==================');
    print('Email: ${bloc.email}');
    print('Password:  ${bloc.password}');
    print('==================');
    
    Navigator.pushReplacementNamed(context, 'home');
  }

   _creatPassword( LoginBloc bloc){

     return StreamBuilder(
       stream: bloc.passwordStream,
       builder: (BuildContext context,  AsyncSnapshot snapshot){
          
       return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Password',
              counterText: snapshot.data ,
               errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
       );
      },
     );

    
  }


  _createBackground( BuildContext context) {

    final size = MediaQuery.of(context).size;

    final background = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178,1.0)
          ]
        )
      ),
    );


    final circle = Container(

      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255,0.05)
      ),
    );


    return Stack(
      children: [
        background,
        
        Positioned( top: 80.0, left: 20.0, child: circle,),
        Positioned( top: -40.0, right: -30.0, child: circle,), 
        Positioned( top: 50.0, right: 40.0, child: circle,), 


        Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Icon( Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity,),
              Text('Goncalves Higino', style: TextStyle( color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }




}
