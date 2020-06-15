import 'package:wolpray_project/src/models/Classes/request_result.dart';
import 'package:wolpray_project/src/models/Classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wolpray_project/src/pages/login_page.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';
import 'package:wolpray_project/src/utils/utils.dart';

class UserPreferences{

  static final UserPreferences _instance = new UserPreferences._inernal();
  final _requestResultProider = new RequestResultProvider();

  User _userLoged;
  factory UserPreferences(){
    return _instance;
  }


  UserPreferences._inernal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
    RequestResult result = await _requestResultProider.getUserByEmail(_prefs.getString('email'));
    if(result.code == 1){
      this._userLoged  = User.fromJson(result.toJson()['data']);
      id = this._userLoged.id;
    }
    
  }

  Future<RequestResult>  login(String email, String password) async {
    RequestResult result = await _requestResultProider.login(email, password);

    if(result.code == 1){
      _userLoged = User.fromJson(result.toJson()['data']);
    }
    return result;
  }

  Future<RequestResult>  remove() async {
    RequestResult result ;
    if(_userLoged != null){
     result = await _requestResultProider.remove(_userLoged);
  
    }
    return result;  
  }


  //Getters
  get email{
    return _prefs.getString('email')??'';
  }

  User getUser(){
    return _userLoged;
  }

  get user{

  }

  get lastPage{
    return _prefs.getString('lastpage')??LoginPage.routeName;
  }


  get id{
    return _prefs.getInt('id')??0;
  }

  //setters
  set email(String email){
    _prefs.setString('email', email);
  }


  set id(int id){
     _prefs.setInt('id',id);
  }

  set lastPage(String value){
    _prefs.setString('lastpage', value);
  }

  void dispose(){
    _requestResultProider.logout(_userLoged);
    _prefs.setString('lastpage',LoginPage.routeName);
    _prefs.setInt('id',0);
    _prefs.remove('email');
    _userLoged = null;
  }


}