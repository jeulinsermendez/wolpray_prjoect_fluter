import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wolpray_project/src/models/Classes/Product.dart';
import 'package:wolpray_project/src/theme/theme.dart';

class ProductDetails extends StatefulWidget {
  final heroTag;
  final Product product;
  
  ProductDetails(this.heroTag, this.product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(product);
}

class _ProductDetailsState extends State<ProductDetails> {
  Product product;
  _ProductDetailsState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
        ),
        backgroundColor: myTheme.primaryColorDark,
        elevation: 0.0,
        title: Text(
          product.name,
          style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
          )),
          centerTitle: true,
      ),
      backgroundColor: myTheme.primaryColorDark,
      body: ListView(
        physics:  NeverScrollableScrollPhysics(),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height -82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
          Positioned(
            top: 75.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
                color: Colors.white
              ),
              height: MediaQuery.of(context).size.height -100.0,
              width: MediaQuery.of(context).size.width,
            )
          ),
          Positioned(
            top: 30.0,
            left: (MediaQuery.of(context).size.width/2) -100.0,
            child: Hero(
              tag: widget.heroTag,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover
                  )
                ),
                height: 200.0,
                width: 200.0,
              ),
            )
          ),
          Positioned(
            top: 250.0,
            left: 25.0,
            right: 25.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0),

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                  text: product.description
                )
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${product.price} €',
                  style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey)),
                  Container(height: 25.0, color: Colors.grey, width: 1.0),
                  Container(
                    width: 125.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      color: Color(0xFF7A9BEE)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: myTheme.primaryColorDark),
                                child: Center(
                                  child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0),
                                ),
                            ),
                          ),
                          Text('0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0)),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.white),
                                child: Center(
                                  child: Icon(
                                      Icons.add,
                                      color: myTheme.primaryColorDark,
                                      size: 20.0,
                                    )
                                ),
                            ),
                          )
                        ],
                      ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                  ],
                ),
              )
              ],
            ),
          ),
            ],
          )
        ],
      ),
    );
  }
}