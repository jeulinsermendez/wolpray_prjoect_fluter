import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wolpray_project/src/models/Classes/TableDisc.dart';
import 'package:wolpray_project/src/models/Classes/club.dart';
import 'package:wolpray_project/src/models/Classes/promotion_class.dart';
import 'package:wolpray_project/src/models/Classes/request_result.dart';
import 'package:wolpray_project/src/models/Classes/user.dart';



class RequestResultProvider{

  RequestResult _requestResult;
  List<Club> clubList = new List();

  //loginservlet?action=valemail&mail=client1@cliesds

  //final String _url = 'http://192.168.1.72:8080//wolpray';

  final String _url = 'http://apps.proven.cat:8084/WolprayBackendWebService';

  Future<RequestResult> login(String email, String password) async {

    final resp = await http.get('$_url/loginservlet?action=login&mail=$email&pass=$password');

      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));
    return _requestResult;
  }

  Future<RequestResult> getUserByEmail(String email) async{

    final resp = await http.get('$_url/userservlet?action=find_email&mail=$email');

      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));
    return _requestResult;
  }


  Future<RequestResult> validateEmail(String email) async {

    
    final resp = await http.get('$_url/loginservlet?action=valemail&mail=$email');

      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));

    return _requestResult;
  }


  Future<RequestResult> registrer(String userName, String email,String password, String streetName,
                                  String streetNumber, String postalCode, String phone, String city,
                                  String birthdate) async {

    
    final resp = await http.post('$_url/loginservlet?action=registrer&n=$userName&m=$email&p=$password&sna=$streetName&snu=$streetNumber&cp=$postalCode&ph=$phone&ct=$city&brd=$birthdate');

      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));
    return _requestResult;
  }

  Future<List<Club>> getClubList() async{

   final allclubs = '$_url/userservlet?action=list_all_clubs';
   final resp = await http.get(allclubs);
   _requestResult = RequestResult.fromJson(jsonDecode(resp.body));
   final clubs = new Clubs.fromJsnList(_requestResult.data);

    return clubs.clubs;
  }

 Future<List<Promotion>> getPromoList() async{

   final allpromos = '$_url/userservlet?action=list_all_promotions';
   final resp = await http.get(allpromos);
   _requestResult = RequestResult.fromJson(jsonDecode(resp.body));
   final promos = new Promotions.fromJsnList(_requestResult.data);

 return promos.promos;
}


Future<List<Club>> getClubListByName(String name) async{

   final allclubs = '$_url/userservlet?action=list_club_by_name&name=$name';
   final resp = await http.get(allclubs);
   _requestResult = RequestResult.fromJson(jsonDecode(resp.body));
   final clubs = new Clubs.fromJsnList(_requestResult.data);

    return clubs.clubs;
  }

  Future<void> logout(User user) async {

    final resp = await http.get('$_url/loginservlet?action=logout&id=${user.id}');

      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));

    return _requestResult;
  }



  Future<RequestResult> addTableToReserv(TableDisc table, int userid, int clubid) async {

    final resp = await http.post('$_url/clubservlet?action=add_reserv&userid=$userid&clubid=$clubid&table=${jsonEncode(table.toJson())}');

      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));


    return _requestResult;
  }

  //clubservlet?action=list_avai_tab&clubid=1

  Future<List<TableDisc>> availableTables(int clubid) async {

    final resp = await http.get('$_url/clubservlet?action=list_avai_tab&clubid=$clubid');

      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));

      List<TableDisc> list = new TableDiscs.fromJsnList(_requestResult.data).tables;


    return list;
  }

  
  Future<RequestResult> confirmReservations() async {

    final resp = await http.post('$_url/clubservlet?action=confirm_reserv');
  
      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));


    return _requestResult;
  }

  Future<RequestResult> remove(User user) async {
    
    final resp = await http.post('$_url/userservlet?action=remove&id=${user.id}');

      _requestResult = RequestResult.fromJson(jsonDecode(resp.body));
    return _requestResult;
  }

}