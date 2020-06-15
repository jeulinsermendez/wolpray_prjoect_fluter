import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/request_result.dart';
import 'package:wolpray_project/src/models/Classes/user.dart';
import 'package:wolpray_project/src/pages/register_page.dart';
import 'package:wolpray_project/src/preferences/user_preferences.dart';
import 'package:wolpray_project/src/utils/utils.dart';

import 'home_page.dart';


class LoginPage extends StatefulWidget {
  static final String routeName = 'loginpage'; 
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final prefs = UserPreferences();


  String _pass = '';
  String _mail = '';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _makeBackground(context),
          __loginForm(context),
        ],
      )
    );
  }

  Widget _makeBackground(BuildContext context){
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

    //Bubbles design
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
        child:Image.asset('lib/assets/themeLogo.png'),
      );
    }

  Widget __loginForm(BuildContext context){

    final size = MediaQuery.of(context).size;
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
                  child: Image.asset('lib/assets/wonder.png'),
                ),
                _makeEmail(),
                SizedBox(height: 30.0),
                _makePassword(),
                SizedBox(height: 30.0),
                _makeButton(),
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
                child: Text('Registrarse'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed:  () => Navigator.pushReplacementNamed(context, RegisterPage.routeName)
            ),
          ),
          SizedBox(height: 50.0)
      ]),
    );
  }

  Widget _makeEmail(){
    return StreamBuilder(
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
              labelText: 'Email',
            ),
            onChanged: (email){
              _mail = email;
            },
          ),
        );
      },
    );
  }

  Widget _makePassword(){
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(
                color: Colors.black
              ),
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.indigo),
              labelText: 'Contraseña',
            ),
            onChanged: (password){
              _pass = password;
            }
          ),
        );
      },
    );
  }

  Widget _makeButton(){

    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical:  15.0),
          child: Container(
            child: Text('Iniciar sesión'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.indigo,
          textColor: Colors.white,
          onPressed: () =>_login(context)
        );
      },
    );
  }

  _login( BuildContext context) async{


      if(_mail.trim().length > 0){
        RequestResult result = await prefs.login(_mail, _pass);
        if(result != null){
            switch(result.code){
            case -3:
            case -2:
            case -1:
              
              showAlert(context, result.data.toString());
              break;
            case 0:
              showWarning(context, result.data.toString());
              break;
            case 1:
              User user = User.fromJson(result.toJson()['data']);
              prefs.email = user.mail;
              prefs.id = user.id;
              Navigator.pushReplacementNamed(context, HomePage.routeName);
              break;
            default:
              showAlert(context, 'Ha ocurrido un error inesperado con la conexión');
              break;
          }
        }else{
          showAlert(context, 'Ha ocurrido un error inesperado con la conexión');
        }
      }
    }
}
