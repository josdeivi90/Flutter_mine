import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //clases que me permiten caracterizar los estilos
  final estilotexto = new TextStyle(fontSize: 30);
  final estilotexto2 = new TextStyle(fontSize: 40);
  final conteo = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo David'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
        //para poner varios textos
        mainAxisAlignment: MainAxisAlignment.center, //alinear texto
        children: <Widget>[
          Text('Número de clicks: ', style: estilotexto),
          Text('$conteo',
              style: estilotexto2) //conteo.toString() con dolar lo asigno
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Hola Mundo');
        }, //si pongo null me desactiva el boton,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
