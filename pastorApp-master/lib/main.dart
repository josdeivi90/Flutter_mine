
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_notificaction/src/data/controller/active.dart';
import 'package:push_notificaction/src/data/notificaciones.dart';
import 'package:push_notificaction/src/pages/home.dart';
import 'package:push_notificaction/src/pages/login.dart';
import 'package:push_notificaction/src/pages/registro.dart';
import 'package:push_notificaction/src/shared/preferences.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  final pref = Preferences();
  pref.intPreferencrs();
  await Notificaciones.init();
  runApp(MyApp());
  } 

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final pref = Preferences();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider (create: (context) =>NotificationProvider(),)
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes:{
          '/' :(BuildContext context){
            if(pref.uId!=null && pref.uId.toString().isNotEmpty){
              return HomePage();
              
            }else{
                return Login();
            }
          },
          'login'       : (BuildContext context) => Login(),
          'registro'    : (BuildContext context) => Registro(),
          'home'        : (BuildContext context) => HomePage(),          
        }
      ),
    );
  }
}