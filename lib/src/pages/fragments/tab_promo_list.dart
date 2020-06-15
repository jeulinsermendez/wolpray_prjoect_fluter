import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/promotion_class.dart';
import 'package:wolpray_project/src/pages/adapter/promo_adapter.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';


class PromoPage extends StatelessWidget {
  @override


  Widget build(BuildContext context) {

    RequestResultProvider requestresult = new RequestResultProvider();
    final futurePromos =   requestresult.getPromoList();
    
    return FutureBuilder(
      future: futurePromos,
          builder: (BuildContext context, AsyncSnapshot<List<Promotion>> snapShot){
            if(snapShot.hasData){
                return makePromos(snapShot.data);
            }else{
               return CircularProgressIndicator();
            }
           
      }
      );
  }

  Scaffold makePromos(List<Promotion> promos) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:(promos.length ==0) ? Center(
        child: CircularProgressIndicator(),
      ):PromoList(promos)
  );
  }
}


//WIDGETS
//****************
class PromoList extends StatelessWidget {
  final List<Promotion> promos;

  const PromoList(this.promos);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 600,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 39),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
              itemCount: promos.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: makePromos(promos[index], promos[index],context),
                );
              }
        ),
      ),
    );
  }

  Widget makePromos(Promotion promo, tag, BuildContext context){
    return Container(
      height: 300,
      child: Hero(
        tag: tag, 
        child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, PagePromo.routeName,arguments:  promo);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            height: 250,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(promo.name,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
                        ],
                      ) 
                      ),
                      GestureDetector(
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

              ],
            ),
            ),
        )
        ),
    );
  }
}
