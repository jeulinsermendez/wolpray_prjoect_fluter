import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wolpray_project/src/blocs/widgetprovider.dart';
import 'package:wolpray_project/src/blocs/registrer_bloc.dart';
import 'package:wolpray_project/src/pages/login_page.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';
import 'package:wolpray_project/src/utils/registrer_utils.dart';


class RegisterPage2 extends StatelessWidget {
  static final String routeName = 'registrerpage2'; 

  final _requestResultProider = new RequestResultProvider();
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              _crearFondo(context),
              __loginForm(context),
              SizedBox(height: 30.0)
            ],
          )
        ),
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
        _iconWolpray(),
      ],
    );
  }

  Widget _iconWolpray(){
      return Container(
        
        child: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              
              Center(child: Image.asset('lib/assets/logo2.png', width: 600)),
            ],
          ),
        ),
      );
    }

  Widget __loginForm(BuildContext context){

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
                makeuserName(bloc),
                SizedBox(height: 30.0),
                makePhone(bloc),
                SizedBox(height: 30.0),
                makeBirthDate(bloc),
                SizedBox(height: 30.0),
                makeStreetName(bloc),
                SizedBox(height: 30.0),
                makeStreetNumber(bloc),
                SizedBox(height: 30.0),             
                makePostalCode(bloc),
                SizedBox(height: 30.0),
                makeCity(bloc),
                SizedBox(height: 30.0),
                makeButtonRegistrer(bloc, _requestResultProider),
                SizedBox(height: 20.0),
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

  _backToLogin(BuildContext context, RegistrerBloc bloc ) {
    bloc.dispose();
    Navigator.popAndPushNamed(context,LoginPage.routeName);
  }

  Widget makeBirthDate(RegistrerBloc bloc){
    return StreamBuilder(
      stream: bloc.birthDateStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.date_range, color: Colors.indigo),
              labelText: 'Fecha de nacimiento',
              counterText: 'YYYY-MM-DD',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeBirhtDate
          ),
        );
      },
    );
  }
}