import 'dart:ui';

import 'package:flutter/material.dart';



void showAlert(BuildContext context, String msg){

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AnimatedContainer(
          duration: Duration(seconds: 1),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30),
               side: BorderSide(
                 color: Colors.black26,
                 style: BorderStyle.solid,
                 width: 3
               )
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width:100.0,
                    child: Image.asset('lib/assets/emojialert.png'),
                  ),
                Text(msg, style: TextStyle(color: Colors.black)),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    ).timeout(Duration(seconds: 1));
}


void showWarning(BuildContext context, String msg) async {

 await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),
             side: BorderSide(
               color: Colors.black26,
               style: BorderStyle.solid,
               width: 3
             )
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width:100.0,
                  child: Image.asset('lib/assets/alerta.png'),
                ),
              Text(msg, style: TextStyle(color: Colors.black)),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                print('Le has dado al ok');
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      }
    );
}


void showMissage(BuildContext context, String msg){

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AnimatedContainer(
          duration: Duration(seconds: 1),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30),
               side: BorderSide(
                 color: Colors.black26,
                 style: BorderStyle.solid,
                 width: 3
               )
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width:100.0,
                    child: Image.asset('lib/assets/coolemoji.png'),
                  ),
                Text(msg, style: TextStyle(color: Colors.black)),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    ).timeout(Duration(seconds: 1));
}