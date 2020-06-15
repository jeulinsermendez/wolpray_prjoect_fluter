import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/club.dart';
import 'package:wolpray_project/src/providers/request_provider.dart';

class DataSearch extends SearchDelegate{
  Club selection;
  final requestProvider = new RequestResultProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
      // Las acciones de app bar
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = '';
          })
      ];
    }
  
    @override
  Widget buildLeading(BuildContext context) {
      // Icono a la izquierda de appBar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation
        ),
        onPressed: (){
          close(context, null);
        });
    }
  
    @override
    Widget buildResults(BuildContext context ) {
      // Crea los resultados que vamos a mostrar
      //Navigator.pushNamed(context, 'clubpage',arguments: club);
      return  Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Aquí van las sugerencias que aparecen cuando se escribe

    if(query.isEmpty){
      return FutureBuilder(
      future: requestProvider.getClubList(),
      builder: (BuildContext context, AsyncSnapshot<List<Club>> snapshot){
        if(snapshot.hasData){
          final clubs = snapshot.data;
          return ListView(
            physics: BouncingScrollPhysics(),
            children: clubs.map((club) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(club.coverUrl),
                  placeholder: AssetImage('lib/assets/img/loading.gif'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(club.name,style: TextStyle(
                color: Colors.black
              )),
                subtitle: Text(club.ambience,style: TextStyle(
                color: Colors.black
              )),
                onTap: (){                  
                  Navigator.pushNamed(context, 'clubpage',arguments: club);
                },
              );
            }).toList(),
          );
        }else{
          return Center(
            child: CircularProgressIndicator()
          );
        }
      }
    );
    }

    return FutureBuilder(
      future: requestProvider.getClubListByName(query),
      builder: (BuildContext context, AsyncSnapshot<List<Club>> snapshot){
        if(snapshot.hasData){
          final clubs = snapshot.data;
          return ListView(
            physics: BouncingScrollPhysics(),
            children: clubs.map((club) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(club.coverUrl),
                  placeholder: AssetImage('lib/assets/img/loading.gif'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(club.name,style: TextStyle(
                color: Colors.black
              )),
                subtitle: Text(club.ambience,style: TextStyle(
                color: Colors.black
              )),
                onTap: (){                  
                  Navigator.pushNamed(context, 'clubpage',arguments: club);
                },
              );
            }).toList(),
          );
        }else{
          return Center(
            child: CircularProgressIndicator()
          );
        }
      }
    );
  }

}