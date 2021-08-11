import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  //la palabra state es un estandar ---- el metodo privado es con guion bajo
  final _estilotexto = new TextStyle(fontSize: 30);
  final _estilotexto2 = new TextStyle(fontSize: 40);
  int _conteo = 0;
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
            Text('Número de clicks 2: ', style: _estilotexto),
            Text('$_conteo',
                style: _estilotexto2) //conteo.toString() con dolar lo asigno
          ],
        )),
        floatingActionButton: _crearBotones());
  }

  // objeto que me crea botones
  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 20.0),
        FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              _restar();
            }),
        Expanded(child: SizedBox()),
        FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _agregar();
            }),
        SizedBox(width: 20.0),
        FloatingActionButton(child: Icon(Icons.restart_alt), onPressed: _reset),
      ],
    );
  }

  //funciones que nos permite sumar restar y reset
  void _agregar() {
    setState(() {
      _conteo++;
    });
  }

  void _restar() {
    setState(() {
      _conteo--;
    });
  }

  void _reset() {
    setState(() {
      _conteo = 0;
    });
  }
}
