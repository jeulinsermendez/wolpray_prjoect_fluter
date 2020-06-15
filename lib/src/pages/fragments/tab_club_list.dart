import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/club.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';

import 'card_swiper_trending_widget.dart';

//import 'package:flutter_swiper/flutter_swiper.dart';


class ClubPage extends StatefulWidget {
  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  RequestResultProvider requestresult = new RequestResultProvider();

    @override
    Widget build(BuildContext context) {
      final _screenSize = MediaQuery.of(context).size;
      return SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: trending(context, _screenSize.height *0.2),
              ),
            );
    }

Widget trending(BuildContext context, double size){
  return Column(
    children: <Widget>[
      Container(
        width: double.infinity,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              _SwiperTrending(size),
            ],
          ),
        ),
      ),
      SizedBox(height: 10),
      Expanded(child: getClubList(context)),
    ],
                
  );
}

Widget  _SwiperTrending(double size){
    final futureClubs =  requestresult.getClubList();

  return FutureBuilder(
    future:futureClubs ,
    builder:(BuildContext context, AsyncSnapshot <List<Club>> snapShot){
      if(snapShot.hasData){
        return CardSwiper( cubs: snapShot.data, heigh: size);
      }else{
        return CircularProgressIndicator();
      }

    } ,
    );
}

Widget getClubList(BuildContext context) {
    
    
    final futureClubs =  requestresult.getClubList();
  return FutureBuilder(
    future:futureClubs ,
    builder: (BuildContext context, AsyncSnapshot <List<Club>> snapShot){
      if(snapShot.hasData){
        return gridViewBuilder(snapShot.data, context);
      }else{ 
        return CircularProgressIndicator();
      }
      
    }
      
  ); 
}

Widget gridViewBuilder(List<Club> clubs, BuildContext context) {
  return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: clubs.length,
      padding: EdgeInsets.all(10),
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index){
        return makeClub(context, clubs[index]);
      },
    );
}

Widget makeClub(BuildContext context, Club club) {
  return InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'clubpage',arguments: club);
            },
            child: Card(
            color: Colors.transparent,
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                image:NetworkImage(club.coverUrl) ,
                fit: BoxFit.cover
              )
              ),
            ),
          ),
        );
}
}
