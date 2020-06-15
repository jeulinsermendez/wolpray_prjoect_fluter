import 'package:flutter/material.dart';
import 'package:wolpray_project/src/blocs/registrer_bloc.dart';
export 'package:wolpray_project/src/blocs/registrer_bloc.dart';

class WidgetProvider extends InheritedWidget{

  static WidgetProvider _instance;


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  final registrerBloc = RegistrerBloc();
  factory WidgetProvider({Key key, Widget child}){
    if(_instance == null){
      _instance = new WidgetProvider._internal(key:key,child: child);
    }

    return _instance;
  }

  WidgetProvider._internal({Key key, Widget child})
  : super(key: key, child: child);





  

  static RegistrerBloc of (BuildContext context){//Esto es una funcion que devuelve un objeto LoginBloc

    return context.dependOnInheritedWidgetOfExactType<WidgetProvider>().registrerBloc;

  }

}