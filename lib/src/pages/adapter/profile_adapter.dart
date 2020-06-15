import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:wolpray_project/src/constants/constants.dart';
import 'package:wolpray_project/src/models/Classes/request_result.dart';
import 'package:wolpray_project/src/models/Classes/user.dart';
import 'package:wolpray_project/src/pages/home_page.dart';
import 'package:wolpray_project/src/pages/login_page.dart';
import 'package:wolpray_project/src/preferences/user_preferences.dart';
import 'package:wolpray_project/src/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  final prefs = new UserPreferences();
  static final String routeName = 'profilepage';
  @override
  Widget build(BuildContext context) {
    User user =  prefs.getUser();
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
var profileInfo = Expanded(
    child: Column(
      children: <Widget>[
        Container(
          height: kSpacingUnit.w * 10,
          width: kSpacingUnit.w * 10,
          margin: EdgeInsets.only(top:kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: NetworkImage('https://i.imgur.com/tXkwSsu.png'),//TODO
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle
                    ),
                    child: InkWell(
                        child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                      onTap: (){
                        showWarning(context, "¡Falta por implementar!");
                      },
                    ),
                  ),
                )
              ],
            ),
        ),
        SizedBox(height: kSpacingUnit.w * 2),
        Text('${user.userName}', style: kTitleTextStyle),
        SizedBox(height: kSpacingUnit.w * 0.5),
        Text('${user.mail}', style: kCaptionTextStyle),
        SizedBox(height: kSpacingUnit.w * 2),
        Container(
          height: kSpacingUnit.w *4,
          width: kSpacingUnit.w *20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSpacingUnit.w *3),
            color: Theme.of(context).accentColor,
          ),
          child:InkWell(
              child: Center(
              child: Text('Editar perfil', style: kButtonTextStyle),
            ),
            onTap: () => showWarning(context, "¡Falta por implementar!"),
          ))

      ],
    ),
  );
        
        
        var header = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: kSpacingUnit.w * 3),
          InkWell(
            child: Icon(LineAwesomeIcons.arrow_left, color: Colors.white,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3)),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          profileInfo,
          SizedBox(width: kSpacingUnit.w * 3),
        ],
      );
                
                
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 5),
          header,
          Expanded(
            child: ListView(
              physics:  NeverScrollableScrollPhysics(),
              children: <Widget>[
                InkWell(
                    child: ProfileListItem(
                    icon: LineAwesomeIcons.user_plus,
                    text: 'Invitar amigo',
                  ),
                  onTap: (){
                    showWarning(context, "¡Falta por implementar!");
                  },
                ),
                InkWell(
                    child: ProfileListItem(
                      icon: LineAwesomeIcons.user_shield,
                      text: 'Privacidad',
                    ),
                  onTap: (){
                    showWarning(context, "¡Falta por implementar!");
                  },
                ),
                InkWell(
                    child: ProfileListItem(
                    icon: LineAwesomeIcons.question_circle,
                    text: 'Ayuda y soporte',
                  ),
                  onTap: (){
                    showWarning(context, "¡Falta por implementar!");
                  },
                ),
                InkWell(
                    child: ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Ajustes',
                  ),
                  onTap: (){
                    showWarning(context, "¡Falta por implementar!");
                  },
                ),

                InkWell(
                    child: ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Cerrar sesión',
                    hasNavigation: false,
                  ),
                  onTap: (){
                    prefs.dispose();
                    Navigator.pushReplacementNamed(context, LoginPage.routeName);
                  },
                ),
                SizedBox(height: 30),
                InkWell(
                    child: ProfileListItem(
                    icon: LineAwesomeIcons.remove_user,
                    text: 'Eliminar cuenta',
                  ),
                  onTap: (){
                    getResult(context,'¿Estas seguro que quieres eliminar la cuenta?',prefs);
                  },
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget{
  final IconData icon;
  final text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4
      ).copyWith(bottom: kSpacingUnit.w * 2),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor
      ),
      child: Row(
        children: <Widget>[
          Icon(this.icon, size: kSpacingUnit.w * 2.5),
          SizedBox(width: kSpacingUnit.w * 2.5),
          Text(this.text,
            style: kTitleTextStyle
            .copyWith(fontWeight: FontWeight.w500)
          ),
          Spacer(),
          Icon(LineAwesomeIcons.angle_right, size: kSpacingUnit.w * 2.5),
        ],
      ),
    );
  }

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
              Text(msg, style: TextStyle(
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
