import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/TableDisc.dart';
import 'package:wolpray_project/src/models/Classes/club.dart';
import 'package:wolpray_project/src/preferences/user_preferences.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';
import 'package:wolpray_project/src/theme/theme.dart';
import 'package:wolpray_project/src/utils/utils.dart';

class TableAdapter extends StatefulWidget {
  static final String routeName = 'tables';
  final Club club;

  const TableAdapter(this.club);
  

  @override
  _TableAdapterState createState() => _TableAdapterState(club);
}

class _TableAdapterState extends State<TableAdapter> {

  RequestResultProvider requestresult = new RequestResultProvider();
    Club club;
    List<TableDisc> tabletList;
    
    UserPreferences pref = new UserPreferences();
    _TableAdapterState(this.club);

    
    @override
    Widget build(BuildContext context) {
      
          return Container(
          child: Scaffold(
            bottomNavigationBar: BottomAppBar(
              color: myTheme.primaryColorDark,
              child: Container(height: 80.0),
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.indigo,
              label: Text('Reservar',style: TextStyle(
                color: Colors.white
              )),
              onPressed: ()async{
                /*RequestResult rq = await requestresult.confirmReservations();
                print(rq.data);
                setState(() {
                  
                });*/

                showWarning(context, "¡Falta por implementar!");
              }),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            backgroundColor: myTheme.primaryColorDark,
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120.0),
                  child: getTitleText('Reserva de mesa'),
                ),
                  SizedBox(height: 40.0),
                  Container(
                    height: MediaQuery.of(context).size.height - 185.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(90.0), topRight: Radius.circular(90.0)),
                    ),
                    child: SingleChildScrollView(
                      child:FutureBuilder(
                      future: requestresult.availableTables(club.id),
                      builder: (BuildContext context, AsyncSnapshot<List<TableDisc>> snapshot){
                        if(snapshot.hasData){
                      
                            tabletList = snapshot.data;
                            return getTableItem(context);
                          
                        }else{
                          return CircularProgressIndicator();
                        }
                      }
                  ),
                                    
                ),
              )
          ],
        ),
      ),
    );
  }



  Widget _buildTableItem(BuildContext context, TableDisc table){
    return Padding(
        padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
        child: InkWell(
          onTap: ()async {
                //RequestResult requestResult = await requestresult.addTableToReserv(table, pref.id, club.id);
                //print(requestResult.data);
          },
          child: Container(
            width: MediaQuery.of(context).size.width*0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                   Row(
                    children: <Widget>[
                    ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image(
                            image:(!table.reserved)? AssetImage("lib/assets/img/icons/bar.png"):AssetImage("lib/assets/img/icons/reserved.png"),
                            fit: BoxFit.cover,
                            height: 75.0,
                            width: 75.0,
                            ),
                        ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Mesa numero: ${table.num}',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          (table.vip)?getVipText('Vip'):getVipText('Normal'),
                        ],
                      )
                    ],
                  ),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: (){
                    showWarning(context, "¡Falta por implementar!");
                  }
                )
              ],
            ),
          ),
        ),
      );
  }


  


  Widget getTableItem(BuildContext context){
    return  Padding(
        padding: EdgeInsets.only(top: 45.0),
        child: Container(
          height: MediaQuery.of(context).size.height -300.0,
          child: ListView.builder(
            itemCount: tabletList.length,
            itemBuilder: (BuildContext context, item) =>_buildTableItem(context,tabletList[item]),
          ),
        ),
      );
  }

  Text getVipText(String msg){
    return Text('Zona: '+msg,
            style: TextStyle(
              fontFamily: 'Lemonada',
              fontSize: 15.0,
              color: Colors.grey
            )
          );
  }

  Text getTitleText(String msg){
    return Text(msg,
            style: TextStyle(
              fontFamily: 'Lemonada',
              fontSize: 15.0,
              color: Colors.white
            )
          );
  }
}