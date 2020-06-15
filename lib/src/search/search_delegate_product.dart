import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/Product.dart';
import 'package:wolpray_project/src/pages/adapter/product_detail_adapter.dart';


class DataSearchProduct extends SearchDelegate{
  
  Product productSelected;

  List<Product> list;
  
  DataSearchProduct(this.list);
  
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
          List<Product> productSearched = (query.isEmpty)
                                          ? list
                                          :list.where((product) => product.name.toLowerCase().contains(query.toLowerCase())
                                          ).toList();
    
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: productSearched.length,
            itemBuilder: (context, index){
              return _makeProduct(context, productSearched[index]);
            }
          );
      
      }


      Widget _makeProduct(BuildContext context, Product product){
        return ListTile(
          leading: FadeInImage(
            image: NetworkImage(product.imageUrl),
            placeholder: AssetImage('lib/assets/img/loading.gif'),
            width: 50.0,
            fit: BoxFit.contain,
          ),
          title: Text(product.name,style: TextStyle(
                color: Colors.black
              )),
          subtitle: Text('${product.price} €',style: TextStyle(
                color: Colors.black
              )),
          onTap: (){                  
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(product.id, product)
            ));
          },
        );
      }
    
  }