import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:push_notificaction/src/data/cognito/cognito.dart';

import 'package:push_notificaction/src/style/theme.dart';

// ignore: must_be_immutable
class Confirm extends StatelessWidget {
  

  final themeData = StyleData();
  String _codigo = '';
  final _cognito = Cognito();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('pastor'),
          centerTitle: true,
          backgroundColor: Colors.red.withOpacity(0.9)
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child:Column(
                  children: [
                     Text('Estas a un paso', style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('Revisa tu correo e ingresa el código de confirmación')
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: themeData.decorationInputs(10.0),
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  onChanged: (e)=> _codigo = e,
                  keyboardType: TextInputType.number,
                  decoration: themeData.inputDecoration(' Ingresa el código', false,'null'),
                ),
              ),
               SizedBox(
                height: 10,
              ),
              _buttonConfirm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonConfirm(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container(
        height: 45,
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: () async{
          if(_codigo==''){
            Fluttertoast.showToast(msg: 'Por favor ingrese el codigo');
          }else{
            final result = await _cognito.confirEmail(_codigo);
            if(result){
            Fluttertoast.showToast(msg: 'Verficacion exitosa');
              Navigator.pushReplacementNamed(context, 'home');
            }else{
              Fluttertoast.showToast(msg: 'Codigo Incorrecto');
            }
          }

        }, 
        child: Text('Confirmar'),
         style: ElevatedButton.styleFrom(
          shape:  themeData.shape(),
          primary: Colors.red.withOpacity(0.9),          
        )
        )
        );
  }
}


