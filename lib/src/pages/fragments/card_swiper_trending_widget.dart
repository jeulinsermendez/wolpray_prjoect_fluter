import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wolpray_project/src/models/Classes/club.dart';
class CardSwiper extends StatelessWidget {

  final List<Club> cubs;
  final double heigh;
 CardSwiper({Key key, @required this.cubs,@required this.heigh}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.only(left: 10.0, right: 10.0),
    height: heigh,
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return InkWell(
              onTap: (){
                   Navigator.pushNamed(context, 'clubpage',arguments: cubs[index]);
              },
                child: Container( 
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(cubs[index].coverUrl))
                )),
            );
          },
          itemCount: 5,
          pagination: new SwiperPagination(),
          control: new SwiperControl(color: Colors.white),
        ),
    );
  }
}