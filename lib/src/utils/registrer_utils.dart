import 'package:flutter/material.dart';
import 'package:wolpray_project/src/blocs/registrer_bloc.dart';
import 'package:wolpray_project/src/models/Classes/request_result.dart';
import 'package:wolpray_project/src/pages/login_page.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';
import 'package:wolpray_project/src/utils/utils.dart';

Widget makeuserName(RegistrerBloc bloc){

    return StreamBuilder(
      stream: bloc.nameStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle, color: Colors.indigo),
              labelText: 'Nombre de usuario',
              counterText: 'Un nombre que te identifique',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeName,
          ),
        );
      },
    );
  }



  Widget makeStreetName(RegistrerBloc bloc){
    return StreamBuilder(
      stream: bloc.streetNameStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.place, color: Colors.indigo),
              labelText: 'Nombre de calle',
              counterText: 'Ej: C/mas',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeStreetName
          ),
        );
      },
    );
  }

  Widget makeStreetNumber(RegistrerBloc bloc){
    return StreamBuilder(
      stream: bloc.streetNumberStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.place, color: Colors.indigo),
              labelText: 'Número de calle',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeStreetNumber
          ),
        );
      },
    );
  }


  Widget makeCity(RegistrerBloc bloc){
    return StreamBuilder(
      stream: bloc.cityStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.place, color: Colors.indigo),
              labelText: 'Ciudad',
              counterText: 'Donde residas',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeCity
          ),
        );
      },
    );
  }

  Widget makeBirthDate(RegistrerBloc bloc){
    return StreamBuilder(
      stream: bloc.cityStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.place, color: Colors.indigo),
              labelText: 'Fecha de naimiento',
              counterText: 'YYYY-MM-DD',
              errorText: snapshot.error,

            ),
            onChanged: bloc.changeCity
          ),
        );
      },
    );
  }


  Widget makePostalCode(RegistrerBloc bloc){
    return StreamBuilder(
      stream: bloc.postalCodeStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.place, color: Colors.indigo),
              labelText: 'Código postal',
              counterText: 'Ej: 08905',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePostalCode
          ),
        );
      },
    );
  }


  Widget makePhone(RegistrerBloc bloc){
    return StreamBuilder(
      stream: bloc.phoneStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.phone, color: Colors.indigo),
              labelText: 'Teléfono',
              counterText: 'Teléfono',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePhone
          ),
        );
      },
    );
  }


  

  Widget makeButtonRegistrer(RegistrerBloc bloc, RequestResultProvider provider){

    return StreamBuilder(
      stream: bloc.formValidStreamRegisterAll ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical:  15.0),
          child: Container(
            child: Text('Registrarse'),
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.indigo,
          textColor: Colors.white,
          onPressed:  snapshot.hasData ? () =>_registrer(bloc, context, provider): null
        );
      },
    );
  }

  _registrer(RegistrerBloc bloc, BuildContext context, RequestResultProvider provider) async{
      RequestResult result = await provider.registrer(bloc.userName, bloc.mail, bloc.pass, bloc.streetName, bloc.streetNumber, bloc.postalCode, bloc.phone, bloc.city, bloc.birthDate);
      if(result.code == 1){
        showMissage(context, result.data.toString());
        bloc.dispose();
        await Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }else{
        showAlert(context, result.data.toString());
      }
    }