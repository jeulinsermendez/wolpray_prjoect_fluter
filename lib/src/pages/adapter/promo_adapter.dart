import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/promotion_class.dart';
import 'package:wolpray_project/src/utils/fade_animation.dart';
class PagePromo extends StatelessWidget {
  static final String routeName = 'promopage'; 
  @override
  Widget build(BuildContext context) {
    final Promotion promo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: promo, 
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: NetworkImage(promo.coverUrl),
              fit: BoxFit.cover
              ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(0, 10)
              )
            ]
            ),
            child: Stack(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Container(
                        child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                      ),
                    ),
                      GestureDetector (
                          onTap: (){
                        print('Aqui daremos like');
                      },
                          child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: Center(
                            child: Icon(Icons.favorite_border,size: 20,),
                          ),
                        ),
                      )
                  ],
                  
                )
                  ,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(.0),
                        ]
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      verticalDirection: VerticalDirection.up,
                      children: <Widget>[
                        FadeAnimation(0.9,  
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                              onTap: (){
                                print('Aqui compraremos entradas');
                              },
                              child: Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                child: Text('Comprar entrada',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        )),
                        FadeAnimation(1.0,
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Container(
                              child: Text(promo.description,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
        
    );
  }
}