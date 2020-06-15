import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:wolpray_project/src/blocs/validators_login.dart';

class LoginBloc with LoginValidators{
  final _emailController  = BehaviorSubject<String>();
  final _passController   = BehaviorSubject<String>();


   
//validateStreetName
  //Getter
  Stream<String> get emailStream   => _emailController.stream.transform(validateMail);
  Stream<String> get passStream    => _passController.stream.transform(validatePassword);


  Stream<bool> get formValidStream => 
    CombineLatestStream.combine2(emailStream, passStream, (e, p) => true);



      //Setter
  Function(String) get changeEmail  => _emailController.sink.add;
  Function(String) get changePass   => _passController.sink.add;


    //Get values of the password and the email
  String get mail => _emailController.value;
  String get pass => _passController.value;

  dispose(){
    _emailController.close();
    _passController.close();
  }

}