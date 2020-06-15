import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolpray_project/src/models/Classes/user.dart';
import 'package:wolpray_project/src/preferences/user_preferences.dart';
import 'package:wolpray_project/src/search/search_delegate.dart';
import 'package:wolpray_project/src/theme/theme.dart';

import 'fragments/drawer_page.dart';
import 'fragments/tab_club_list.dart';
import 'fragments/tab_promo_list.dart';
class HomePage extends StatelessWidget {
  final prefs = new UserPreferences();
  
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    final User user = prefs.getUser();
    return ChangeNotifierProvider(
      create: (_) => new _NavegationModel(),
          child: Scaffold(
            drawer: DrawerPage(user: user),
            appBar: _getAppBar(context),
            body: Stack(
            children: <Widget>[
            _fondoApp(),
            _homePages(),
          ],
        ),
        bottomNavigationBar: _bottonNvigationBar()
      ),
    );
  }
}

 Widget _fondoApp() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.3),
          end:  FractionalOffset(0.5, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
            myTheme.primaryColor
          ]
        )  
      ),
    );

    final boxDecoration = Transform.rotate(
      angle: -pi/5.0,
      child: Container(
      height: 360.0,
      width: 360.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90.0),
          gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.3),
            end:  FractionalOffset(0.5, 1.0),
            colors: [
              myTheme.primaryColorDark,
              Color.fromRGBO(35, 37, 57, 1.0),
              myTheme.primaryColor
            ]
          ) 
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          child: boxDecoration
        )
      ],
    );
  }

class _homePages extends StatelessWidget {

  

  @override
  Widget build  (BuildContext context){
    final pnavegationModel = Provider.of<_NavegationModel>(context);

    return PageView(
      controller: pnavegationModel.pageCntroller, 
      children: <Widget>[
        ClubPage(),
       // Container(color: Colors.green,),
        PromoPage()
      ],
    );
  }

}


//** BUTTON NAVIGATION BAR */

class _bottonNvigationBar extends StatelessWidget {


  @override
  Widget build  (BuildContext context){
    final navegationModel = Provider.of<_NavegationModel>(context);
    return _makeButtomNavigationBar(context, navegationModel);
  }

  Widget _makeButtomNavigationBar(BuildContext context, _NavegationModel navegationModel) {

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: myTheme.primaryColor.withOpacity(0.70),
        primaryColor: Colors.white60,
        textTheme: Theme.of(context).textTheme
        .copyWith(caption: TextStyle(color:myTheme.primaryColorDark))
      ),
      child: BottomNavigationBar( 
      iconSize: 25,
      currentIndex: navegationModel.actualPage,
      onTap: (i) => navegationModel.actualPage = i,
      items:[
        BottomNavigationBarItem(icon: ImageIcon(AssetImage('lib/assets/img/icons/clubslogotab.png')),title: Container()),
       // BottomNavigationBarItem(icon: Icon(Icons.public),title: Container()),
        BottomNavigationBarItem(icon: Icon(Icons.dehaze),title: Container())
      ] ,
    ),
    );
  }


  
}

//** model pages */
class _NavegationModel with ChangeNotifier{
  int _actualPage = 0;
  PageController _pageCntroller = new PageController();

  int get actualPage => this._actualPage;

  PageController get pageCntroller => _pageCntroller;

  set actualPage(int value) {
    _actualPage = value;
    _pageCntroller.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}





AppBar _getAppBar(BuildContext context){
  return AppBar(
        backgroundColor: myTheme.primaryColorDark.withOpacity(0.95),
        centerTitle: true,
        elevation: 0,
        title: Image.asset('lib/assets/themeLogo.png',height: 50),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ]
      );
}