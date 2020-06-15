import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/Product.dart';
import 'package:wolpray_project/src/models/Classes/TableDisc.dart';
import 'package:wolpray_project/src/models/Classes/club.dart';
import 'package:wolpray_project/src/pages/adapter/product_adapter.dart';
import 'package:wolpray_project/src/pages/adapter/tables_adapter.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';
import 'package:wolpray_project/src/utils/fade_animation.dart';
import 'package:wolpray_project/src/utils/utils.dart';


class PageClub extends StatefulWidget {
 static final String routeName = 'clubpage'; 
  @override
  _PageClubState createState() => _PageClubState();
}

class _PageClubState extends State<PageClub> {
  RequestResultProvider requestresult = new RequestResultProvider();
    final List<TableDisc> reservationList = new List();
    final List<Product> productList = new List();
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);
 
  @override
  Widget build(BuildContext context) {
    final Club club = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _makeClubHeader(club),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1.7,
                        Text(club.description,
                          style: textStyleNormalText())),
                          SizedBox(height: 20),
                         FadeAnimation(1.7,
                         Text('Horario', style: textStyleSubTitle())
                         ),
                         SizedBox(height: 10),
                         FadeAnimation(1.7,
                         _makeHorario(club.schedule[0].day, club.schedule[0].openingTime, club.schedule[0].closingTime)),
                         SizedBox(height: 2),
                          FadeAnimation(1.7,
                         _makeHorario(club.schedule[1].day, club.schedule[1].openingTime, club.schedule[1].closingTime)),
                         SizedBox(height: 2),
                          FadeAnimation(1.7,
                         _makeHorario(club.schedule[2].day, club.schedule[2].openingTime, club.schedule[2].closingTime)),
                         SizedBox(height: 20.0),
                         FadeAnimation(1.8,
                          Divider(thickness: 4, color: Colors.blueGrey, height: 0)),
                        FadeAnimation(1.8,
                          Container(
                            child: _actionList(club),
                          )),
                        SizedBox(height: 2),
                        FadeAnimation(1.8,
                          Divider(thickness: 4, color: Colors.blueGrey, height: 0)),
                          SizedBox(height: 10),
                          FadeAnimation(1.7,
                         Row(children: <Widget>[
                           Text('Contacto:', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                           SizedBox(width: 170),
                           Text('${club.phone}', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic))
                         ],)),
                      ],
                    ),
                  )
                ]),
              )
            ],
          )
        ],
      )
    );
  }


Widget _actionList(Club club){
  return Table(
    children: [
      TableRow(
        children: [
          InkWell(
            child: makeAction(Colors.black26, Icons.calendar_today, 'Reservar mesa', club),
            onTap: () async{
              Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TableAdapter(club)
          ));
              
            },
            ),
          InkWell(
            child: makeAction(Colors.black26, Icons.bubble_chart, 'Ver productos', club),
            onTap: (){
              List<Product> products = new List();
              for(Product product in club.productList){
                if(product.category != 'Ticket'){
                  products.add(product);
                }
              }
              Navigator.pushNamed(context, ProductsAdapter.routeName,arguments: products);
            },
          ),
        ]
      ),
      TableRow(
        children: [
          InkWell(
            child: makeAction(Colors.black26, Icons.euro_symbol, 'Comprar entrada', club),
            onTap: (){
              showWarning(context, "¡Falta por implementar!");
            },
            ),
          InkWell(
            child: makeAction(Colors.black26, Icons.phone, 'Ver Promociones', club),
            onTap: (){
              showWarning(context, "¡Falta por implementar!");
            },
            ),
        ]
      )
    ],
  );
}


Widget makeAction(Color color, IconData icon, String text,Club club){
  return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 5.0, sigmaY: 5.0 ),
        child: Container(
        height: 180.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 5.0,),
            CircleAvatar(
              backgroundColor: color,
              radius: 35,
              child: Icon(icon, color: Colors.white, size: 30.0,),
            ),
            Text(text, style: textStyleNormalText()),
            SizedBox(height: 5.0,)
          ],
        ),
      ),
    ),
  );
}


  Widget _makeClubHeader(Club club){
    return SliverAppBar(
      expandedHeight: 450,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        background:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(club.coverUrl),
              fit: BoxFit.cover,
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(.3)
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Column(
                      children: <Widget>[
                        Divider(thickness: 2, color: Colors.blueGrey, height: 0.0),
                        Text(club.name, style:textStyleTitle()),
                        Divider(thickness: 2, color: Colors.blueGrey, height: 0.0),
                      ],
                    )),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      FadeAnimation(1.2,
                      Text('${club.ambience}', style:textStyleNormalText())),
                    SizedBox(width: 70),
                    FadeAnimation(1.3,
                      Text('${club.dressCode}', style:textStyleNormalText()))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      FadeAnimation(1.4,
                      Text('${club.streetName}, ${club.streetNumber}', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic))),
                      SizedBox(width: 60),
                      FadeAnimation(1.5,
                      Text('${club.city}', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic))),
                      SizedBox(height: 15),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



    Row _makeHorario(String day, String openingTime, String closingTime){
      return Row(
              children: <Widget>[
                Text(day, style: textStyleNormalText()),
                SizedBox(width: 10),
                Text('$openingTime a.m. ', style: textStyleNormalText()),
                SizedBox(width: 2),
                Text('-',style: textStyleNormalText()),
                SizedBox(width: 2),
                Text(' $closingTime a.m.',style: textStyleNormalText()),
              ],
            );
    }



  //** Text Styles */
  TextStyle getTextStyleblack(){
    return TextStyle(
      color: Colors.white,
      fontSize: 10.0,
      fontFamily: 'Lemonada',
      fontWeight: FontWeight.w600);
  }


  TextStyle getTextStyleButton(){
    return TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontFamily: 'Lemonada',
      fontWeight: FontWeight.w600);
  }

  TextStyle textStyleTitle(){
    return TextStyle(
      fontSize: 40.0,
      color: Colors.white,
      fontFamily: 'Lemonada',
      fontWeight: FontWeight.bold);
  }


  TextStyle textStyleSubTitle(){
    return TextStyle(
      fontSize: 20.0,
      color: Colors.white,
      fontFamily: 'Lemonada',
      fontWeight: FontWeight.bold);
  }

  TextStyle textStyleNormalText(){
    return TextStyle(color: Colors.white70, fontSize: 16);
  }

}
