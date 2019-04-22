import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';



class Muestra_QR extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          
         primaryColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Inicio_QR(),
    );
  }
}


class Inicio_QR extends StatefulWidget{
  _QR createState () => _QR();
}
String ip="";
class _QR extends State <Inicio_QR>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Codigo QR  $ip")

      ) ,

      body: Container(
        
        child: Center(
          child:  QrImage(
          data:  ip  ,
          size: 200.0,
        ),
        
        ),
   
      )
      );
  }
}
