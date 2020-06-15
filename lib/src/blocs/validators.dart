import 'dart:async';

class Validators{


  static String _pass;
  final validateMail = StreamTransformer<String, String>.fromHandlers(
      handleData: (mail, sink){
        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = new RegExp(pattern);
        if(regExp.hasMatch(mail)){
          sink.add(mail);
        }else{
          sink.addError('*Correo inválido');
        }
      }
    );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){

      if(password.length >= 8){
        sink.add(password);
        _pass = password;
      }else{
        sink.addError('*Tiene que tener un mínimo de 8 carácteres');
      }

    }
  );

  final validateRePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (rePassword, sink){

      if(rePassword.endsWith(_pass)){
        sink.add(rePassword);
      }else{
        sink.addError('*Las contraseñas tienen que coincidir');
      }

    }
  );

  final validatePhone = StreamTransformer<String, String>.fromHandlers(
    handleData: (phone, sink){
      Pattern pattern = r'(\6|7)?([0-9]){9}';
      RegExp regExp = new RegExp(pattern);
        if(regExp.hasMatch(phone)){
          sink.add(phone);
        }else{
          sink.addError('*Número de téfono obligatorio');
        }
    }
  );

  final validateStreetName = StreamTransformer<String, String>.fromHandlers(
    handleData: (streetName, sink){

        if(streetName.length > 0){
          sink.add(streetName);
        }else{
          sink.addError('*Obligatorio');
        }

    }
  );

  //^[0-9]+$
  final validateStreetNumber = StreamTransformer<String, String>.fromHandlers(
    handleData: (treetNumber, sink){
      Pattern pattern = r'^[0-9]+$';
      RegExp regExp = new RegExp(pattern);
        if(regExp.hasMatch(treetNumber)){
          sink.add(treetNumber);
        }else{
          sink.addError('*Obligatorio');
        }
    }
  );
  
  //^(?:0?[1-9]|[1-4]\d|5[0-2])\d{3}$
  final validatePostalCode = StreamTransformer<String, String>.fromHandlers(
    handleData: (postalCode, sink){
      Pattern pattern = r'^(?:0?[1-9]|[1-4]\d|5[0-2])\d{3}$';
      RegExp regExp = new RegExp(pattern);
        if(regExp.hasMatch(postalCode)){
          sink.add(postalCode);
        }else{
          sink.addError('*Código postal inválido');
        }
    }
  );

  final validateCity = StreamTransformer<String, String>.fromHandlers(
    handleData: (city, sink){
      if(city.length > 0){
          sink.add(city);
        }else{
          sink.addError('*Obligatorio');
        }
    }
  );


  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink){
      if(name.length > 0){
          sink.add(name);
        }else{
          sink.addError('*Obligatorio');
        }
    }
  );

  final validateBithdate = StreamTransformer<String, String>.fromHandlers(
    handleData: (birhtDate, sink){
      Pattern pattern = r'^\d{4}([-])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$';
      RegExp regExp = new RegExp(pattern);
        if(regExp.hasMatch(birhtDate)){
          sink.add(birhtDate);
        }else{
          sink.addError('*Fecha inválida');
        }
    }
  );

  //^([0-9]){4}-([0-9]){2}-([0-9]){2}$


}