import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:wolpray_project/src/blocs/validators.dart';

class RegistrerBloc with Validators{
  final _emailController  = BehaviorSubject<String>();
  final _passController   = BehaviorSubject<String>();
  final _rePassController   = BehaviorSubject<String>();
  final _streetNameController   = BehaviorSubject<String>();
  final _streetNumController   = BehaviorSubject<String>();
  final _postalCodeController   = BehaviorSubject<String>();
  final _phoneController   = BehaviorSubject<String>();
  final _cityController   = BehaviorSubject<String>();
  final _birthdateController   = BehaviorSubject<String>();
  final _nameController   = BehaviorSubject<String>();
  
//validateStreetName
  //Getter
  Stream<String> get emailStream   => _emailController.stream.transform(validateMail);
  Stream<String> get passStream    => _passController.stream.transform(validatePassword);
  Stream<String> get rPassStream    => _rePassController.stream.transform(validateRePassword);
  Stream<String> get phoneStream   => _phoneController.stream.transform(validatePhone);
  Stream<String> get streetNameStream   => _streetNameController.stream.transform(validateStreetName);
  Stream<String> get streetNumberStream   => _streetNumController.stream.transform(validateStreetNumber);
  Stream<String> get postalCodeStream   => _postalCodeController.stream.transform(validatePostalCode);
  Stream<String> get cityStream   => _cityController.stream.transform(validateCity);
  Stream<String> get birthDateStream   => _birthdateController.stream.transform(validateBithdate);
  Stream<String> get nameStream   => _nameController.stream.transform(validateName);

  Stream<bool> get formValidStream => 
    CombineLatestStream.combine2(emailStream, passStream, (e, p) => true);

  Stream<bool> get formValidStreamRegister => 
    CombineLatestStream.combine3(emailStream, passStream,rPassStream , (e, p , r) => true);
  Stream<bool> get formValidStreamRegisterAll => 
    CombineLatestStream.combine9(emailStream, passStream,nameStream,birthDateStream,cityStream,postalCodeStream,
     streetNumberStream,streetNameStream , phoneStream, (q,w,e,r,t,y,u,i,o) => true);


  //Setter
  Function(String) get changeEmail  => _emailController.sink.add;
  Function(String) get changePass   => _passController.sink.add;
  Function(String) get changeRePass   => _rePassController.sink.add;
  Function(String) get changePhone   => _phoneController.sink.add;
  Function(String) get changeStreetName   => _streetNameController.sink.add;
  Function(String) get changeStreetNumber   => _streetNumController.sink.add;
  Function(String) get changePostalCode   => _postalCodeController.sink.add;
  Function(String) get changeCity   => _cityController.sink.add;
  Function(String) get changeBirhtDate   => _birthdateController.sink.add;
  Function(String) get changeName   => _nameController.sink.add;


  //Get values of the password and the email
  String get mail => _emailController.value;
  String get pass => _passController.value;
  String get rePass => _rePassController.value;
  String get phone => _phoneController.value;
  String get streetName => _streetNameController.value;
  String get streetNumber => _streetNumController.value;
  String get postalCode => _postalCodeController.value;
  String get city => _cityController.value;
  String get birthDate => _birthdateController.value;
  String get userName => _nameController.value;

  dispose(){
    _emailController?.close();
    _passController?.close();
    _rePassController?.close();
    _phoneController?.close();
    _streetNameController?.close();
    _streetNumController?.close();
    _postalCodeController?.close();
    _cityController?.close();
    _birthdateController?.close();
    _nameController?.close();
  }
}