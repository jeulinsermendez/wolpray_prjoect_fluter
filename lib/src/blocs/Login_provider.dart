import 'package:flutter/material.dart';
import 'package:wolpray_project/src/blocs/registrer_bloc.dart';
export 'package:wolpray_project/src/blocs/registrer_bloc.dart';

class RegistrerProvider extends InheritedWidget{

  static RegistrerProvider _instance;
   final loginBloc = RegistrerBloc();

  factory RegistrerProvider({Key key, Widget child}){
    if(_instance == null){
      _instance = new RegistrerProvider._internal(key:key,child: child);
    }

    return _instance;
  }

  RegistrerProvider._internal({Key key, Widget child})
  : super(key: key, child: child);

 

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  

  static RegistrerBloc of (BuildContext context){//Esto es una funcion que devuelve un objeto LoginBloc

    return context.dependOnInheritedWidgetOfExactType<RegistrerProvider>().loginBloc;

  }

}