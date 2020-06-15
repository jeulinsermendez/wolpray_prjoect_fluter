import 'package:flutter/material.dart';

import 'package:wolpray_project/src/blocs/widgetprovider.dart';
import 'package:wolpray_project/src/constants/constants.dart';

import 'package:wolpray_project/src/pages/adapter/clubs_adapter.dart';
import 'package:wolpray_project/src/pages/adapter/product_adapter.dart';
import 'package:wolpray_project/src/pages/adapter/profile_adapter.dart';
import 'package:wolpray_project/src/pages/adapter/promo_adapter.dart';
import 'package:wolpray_project/src/pages/home_page.dart';


import 'package:wolpray_project/src/pages/login_page.dart';
import 'package:wolpray_project/src/pages/register_page.dart';

import 'package:wolpray_project/src/pages/registrer_page_2.dart';
import 'package:wolpray_project/src/preferences/user_preferences.dart';
import 'package:wolpray_project/src/theme/theme.dart';
import 'package:wolpray_project/src/utils/utils.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
  
}

 
class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {

    return WidgetProvider(
      child: MaterialApp(
        theme:myTheme,
        debugShowCheckedModeBanner: false,
        title: 'Wolpray',
        initialRoute: prefs.lastPage,
        routes: {
          HomePage.routeName           :(BuildContext context) =>HomePage(),
          PageClub.routeName           :(BuildContext context) =>PageClub(),
          PagePromo.routeName          :(BuildContext context) =>PagePromo(),
          LoginPage.routeName          :(BuildContext context) => LoginPage(),
          RegisterPage.routeName       :(BuildContext context) => RegisterPage(),
          RegisterPage2.routeName      :(BuildContext context) => RegisterPage2(),
          ProductsAdapter.routeName    :(BuildContext context) => ProductsAdapter(),
          ProfilePage.routeName        :(BuildContext context) => ProfilePage(),
        },
      ),
    );

    
  }
}