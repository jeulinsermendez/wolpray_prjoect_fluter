import 'package:flutter/material.dart';
import 'package:wolpray_project/src/constants/constants.dart';
import 'package:wolpray_project/src/models/Classes/request_result.dart';
import 'package:wolpray_project/src/models/Classes/user.dart';
import 'package:wolpray_project/src/pages/adapter/profile_adapter.dart';
import 'package:wolpray_project/src/pages/login_page.dart';
import 'package:wolpray_project/src/preferences/user_preferences.dart';
import 'package:wolpray_project/src/utils/utils.dart';
class DrawerPage extends StatelessWidget {
  
  final User user;

  const DrawerPage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    final prefs = UserPreferences();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular( kSpacingUnit * 5.0),
              image: DecorationImage(
                image: NetworkImage('https://i.imgur.com/tXkwSsu.png'),
                fit: BoxFit.cover
              )
            ),
            ),
            Divider(height: 20, color: Colors.blue, thickness: 1),
            ListTile(
              leading: ImageIcon(AssetImage('lib/assets/img/icons/user_settings.png'),size: 40,color: Colors.blue,),
              title: Text('Mi perfil',style: TextStyle(
                color: Colors.black
              )),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage()
                ));
              },
            ),
            Divider(height: 20, color: Colors.blue, thickness: 1),
            ListTile(
              leading: ImageIcon(AssetImage('lib/assets/img/icons/ticket.png'), size: 40,color: Colors.blue),
              title: Text('Mis entradas',style: TextStyle(
                color: Colors.black
              )),
              onTap: () => showWarning(context, "¡Falta por implementar!"),
            ),
            Divider(height: 20, color: Colors.blue, thickness: 1),
            ListTile(
              leading: ImageIcon(AssetImage('lib/assets/img/icons/reserved.png'),size: 40, color: Colors.blue),
              title: Text('Mis reservas',style: TextStyle(
                color: Colors.black
              )),
              onTap: () {
                showWarning(context, "¡Falta por implementar!");
              },
            ),
            Divider(height: 20, color: Colors.blue, thickness: 1),
             ListTile(
              leading: ImageIcon(AssetImage('lib/assets/img/icons/logout.png'),size: 40,color: Colors.blue,),
              title: Text('Cerrar sesión',style: TextStyle(
                color: Colors.black
              )),
              onTap: (){
                prefs.dispose();
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              },
            ),
            Divider(height: 20, color: Colors.blue, thickness: 1),
        ],
      ),
    );
  }

  void getResult(BuildContext context,String msg, UserPreferences prefs) {
    
       showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),
             side: BorderSide(
               color: Colors.black26,
               style: BorderStyle.solid,
               width: 3
             )
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width:100.0,
                  child: Image.asset('lib/assets/alerta.png'),
                ),
              Text(msg,style: TextStyle(
                color: Colors.black
              )),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: (){
               Navigator.of(context).pop();
              } ,
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () async{
              RequestResult result = await prefs.remove();

               if(result.code==1){
                    
                    showMissage(context,result.data);
                    prefs.dispose();
                    Navigator.popAndPushNamed(context, prefs.lastPage);
                }else{
                  showAlert(context,result.data);
                }

                

              },
            )
          ],
        );
      }
    );

  }
}
