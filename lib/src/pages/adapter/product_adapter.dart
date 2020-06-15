import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:wolpray_project/src/constants/constants.dart';
import 'package:wolpray_project/src/models/Classes/Product.dart';
import 'package:wolpray_project/src/pages/adapter/product_detail_adapter.dart';
import 'package:wolpray_project/src/search/search_delegate_product.dart';
import 'package:wolpray_project/src/theme/theme.dart';
import 'package:wolpray_project/src/utils/utils.dart';

class ProductsAdapter extends StatefulWidget {
  static final String routeName = 'product';

  @override
  _ProductsAdapterState createState() => _ProductsAdapterState();
}

class _ProductsAdapterState extends State<ProductsAdapter> {

  List<Product> productList;
  
  Widget build(BuildContext context) {
    
    
    productList = ModalRoute.of(context).settings.arguments;
    
    return Container(
       child: Scaffold(
         backgroundColor: myTheme.primaryColorDark,
         body: ListView(
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
                   Container(
                     width: 125.0,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.white,
                            onPressed: (){
                              showSearch(context: context, delegate: DataSearchProduct(productList));
                            },
                          ),
                       ],
                     ),
                   )
                 ],
               ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(90.0)),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child:
                    Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height -300.0,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: productList.length,
                          itemBuilder: (BuildContext context, item) =>_buildProductItem(context,productList[item], item),
                        ),
                      ),
                    )
                ),
              )
           ],
         ),
       ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product, int index){
    bool isSelected = false;
    String heroID = product.id.toString() +index.toString();
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetails(heroID , product)
          ));
        },
        child: Container(
          width: MediaQuery.of(context).size.width*0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                 Row(
                  children: <Widget>[
                    Hero(
                      tag: heroID,
                      child: (isSelected)? productSelected(product):productUnselected(product),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product.name,
                          style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'Lemonada',
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          )
                        ),
                        Text('${product.price} €',
                          style: TextStyle(
                            fontFamily: 'Lemonada',
                            fontSize: 15.0,
                            color: Colors.grey
                          )
                        ),
                      ],
                    )
                  ],
                ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: (){
                  showWarning(context, "¡Falta por implementar!");
                  isSelected = true;
                  setState(() {});
                }
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget productSelected(Product product){
    return Container(
      height: kSpacingUnit * 10.0,
      width: kSpacingUnit * 10.0,
      margin: EdgeInsets.only(top:kSpacingUnit * 3.0),
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: kSpacingUnit * 5.0,
              backgroundImage: NetworkImage(product.imageUrl)
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: kSpacingUnit * 2.5,
                width: kSpacingUnit * 2.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  shape: BoxShape.circle
                ),
                child: Icon(
                  LineAwesomeIcons.pen,
                  color: kDarkPrimaryColor,
                  size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                ),
              ),
            )
          ],
        ),
    );
  }


  Widget productUnselected(Product product){
    return Container(
      height: kSpacingUnit * 10.0,
      width: kSpacingUnit * 10.0,
      margin: EdgeInsets.only(top:kSpacingUnit * 3.0),
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: kSpacingUnit * 5.0,
              backgroundImage: NetworkImage(product.imageUrl)
            ),
          ],
        ),
    );
  }
}