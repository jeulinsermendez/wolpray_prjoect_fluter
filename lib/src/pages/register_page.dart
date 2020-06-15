import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wolpray_project/src/blocs/registrer_bloc.dart';
import 'package:wolpray_project/src/blocs/widgetprovider.dart';
import 'package:wolpray_project/src/models/Classes/request_result.dart';
import 'package:wolpray_project/src/pages/login_page.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';
import 'package:wolpray_project/src/utils/utils.dart';
import 'package:wolpray_project/src/pages/registrer_page_2.dart';


class RegisterPage extends StatelessWidget {
  static final  String routeName = 'registrer';

  final _requestResultProider = new RequestResultProvider();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
            children: <Widget>[
              _crearFondo(context),
              _registrerForm(context),
            ],
          )
        );

  }



  Widget _crearFondo(BuildContext context){
    final size = MediaQuery.of(context).size;//Para recoger el tamaño de la pantalla

    final purpleBackground =  Container(
      height: size.height * 0.4,//Esto pone el 40 por ciento de la pantalla, si lo quieres entero no pongas
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(59, 144, 184, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ]
        )
      ),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    return Stack(
      children: <Widget>[
        purpleBackground,
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(top: -40.0, right: -30.0, child: circle),
        Positioned(bottom: -50.0, right: -10.0, child: circle),
        Positioned(bottom: 120.0, right: 20.0, child: circle),
        Positioned(bottom: -50.0, left: -20.0, child: circle),
        _iconWolpray()
      ],
    );
  }

  Widget _iconWolpray(){
      return Container(
        padding: EdgeInsets.only(top: 0.0 ),
        child: SingleChildScrollView(
          child:Column(
              children: <Widget>[
                  Center(child: Image.asset('lib/assets/logo2.png', width: 600))
                
              ],
            ),
          
        ),
      );
    }
  
  
  Widget _registrerForm(BuildContext context){

    final size = MediaQuery.of(context).size;
    final bloc = WidgetProvider.of(context);

    
  
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 150.0,
            )
            ),
          Container(
            width: size.width *0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 5.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: 200.0,
                  child: Image.asset('lib/assets/userscolors.png', width: 250),
                ),
                _makeEmail(bloc),
                SizedBox(height: 30.0),
                _makePassword(bloc),
                SizedBox(height: 30.0),
                _remakePassword(bloc),
                SizedBox(height: 30.0),             
                _makeButton(bloc),
                SizedBox(height: 30.0),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 1.0
                )
              ]
            ),
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical:  5.0),
              child: Container(
                child: Text('Volver al inicio'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed:  () => _backToLogin(context, bloc)
            ),
          ),
          SizedBox(height: 50.0),
      ]),
    );
  }

  Widget _makeEmail(RegistrerBloc bloc){

    return StreamBuilder(
      stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(
                color: Colors.black
              ),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.indigo),
              hintText: 'Ejemplo@Email.com',
              labelText: 'Correo',
              counterText: 'Introduzce tu correo electrónico',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );

    
  }

  Widget _makePassword(RegistrerBloc bloc){
    return StreamBuilder(
      stream: bloc.passStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.indigo),
              labelText: 'Contraseña',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePass
          ),
        );
      },
    );
  }

  Widget _remakePassword(RegistrerBloc bloc){


    return StreamBuilder(
      stream: bloc.rPassStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.indigo),
              labelText: 'Repite la contraseña',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeRePass
          ),
        );
      },
    );
  }

  Widget _makeButton(RegistrerBloc bloc){

    return StreamBuilder(
      stream: bloc.formValidStreamRegister ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical:  15.0),
          child: Container(
            child: Text('Siguiente'),
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.indigo,
          textColor: Colors.white,
          onPressed:  snapshot.hasData ? () =>_registrer(bloc, context): null
        );
      },
    );
  }

  _registrer(RegistrerBloc bloc, BuildContext context) async{
      RequestResult result = await _requestResultProider.validateEmail(bloc.mail);

      if(result != null){


        if(result.code == 0){
          showAlert(context, result.data.toString());
        }else{
          Navigator.pushReplacementNamed(context, RegisterPage2.routeName);
        }
      }else{
        showAlert(context, 'Ha ocurrido un error inesperado con la conexión');
      }
    }

  _backToLogin(BuildContext context, RegistrerBloc bloc ) {
    Navigator.popAndPushNamed(context,LoginPage.routeName);
  }
}