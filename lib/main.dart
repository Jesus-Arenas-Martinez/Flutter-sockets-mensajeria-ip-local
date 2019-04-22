import 'package:flutter/material.dart';
import 'mand_msg.dart';
import 'muestraQR.dart';
import 'package:wifi/wifi.dart';
import 'scan.dart';

//import 'package:device_info/device_info.dart';

//import 'dart:ui';
void main() => runApp(Ini_msj());
class Ini_msj extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          
         primaryColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Inicio_accion(),
    );
  }
}

class Inicio_accion extends StatefulWidget{
  _Inico createState () => _Inico();
}

class _Inico extends State <Inicio_accion>{
  getInfoIp() async{
 

  try {
     ip = await Wifi.ip; 
    print("ests es mi direccion ip $ip");
  } catch (e) {
   ip ="Error";
   }
  setState(() => ip);
   
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: TextField(
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
              actions: <Widget>[
          IconButton(
            icon:Image.asset('assets/QR.png'),
            tooltip: 'configuracion ',
            onPressed: () {
                  getInfoIp();
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Muestra_QR(),
                    )
                 // print("este es el nivel de señal $senal");
                   );
            },
          ), IconButton(
            icon: Text("QR"),
            tooltip: 'Scanear QR ',
            onPressed: () {
              getInfoIp();
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScanScreen(),
                  )
                // print("este es el nivel de señal $senal");
              );
            },
          )

           
      ],

      ) ,

      body: Container(
    child: Column(

      children: <Widget>[
        Row(
          children: <Widget>[
           
            RaisedButton(
  child: const Text('Conversaciones'),
  color: Theme.of(context).accentColor,
  elevation: 4.0,
  splashColor: Colors.blueGrey,
  onPressed: () {
    // Perform some action
  },
),
Expanded(
             child: RaisedButton(
  child: const Text('Contactos  D '),
  color: Theme.of(context).accentColor,
  elevation: 4.0,
  splashColor: Colors.blueGrey,
  onPressed: () {
   
  },
)
)
          ],
        )
      ],
    ),
       
      ),   
      floatingActionButton: FloatingActionButton(
       
        tooltip: 'Increment',
        child: Icon(Icons.mail_outline), 
        onPressed: (){
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddcajaTex()),
  );
        }
      )   
      );
  }
}
