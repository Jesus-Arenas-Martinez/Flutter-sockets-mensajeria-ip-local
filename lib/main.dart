import 'package:flutter/material.dart';
import 'mand_msg.dart';
import 'muestraQR.dart';
import 'package:wifi/wifi.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'dart:io';


                  

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
// String msj='holperros';
   Future server(String adrres) async {
  var server = await HttpServer.bind(
    adrres,
    4040,
  );
  print(InternetAddress.anyIPv4);
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response
      ..write('serever $ip')
      ..close();
  }
}
 
  String barcode = "";
  getInfoIp() async{
 

  try {
     ip = await Wifi.ip; 
    print("ests es mi direccion ip $ip");
    server(ip);
  } catch (e) {
   ip ="Error";
   }
  setState(() => ip);
   
}
int n=0;
  @override
  Widget build(BuildContext context) {
    if(n==0){
    getInfoIp();
    print(ip);
    
    n=1;
    }
    return Scaffold(
      appBar:AppBar(
        title: barraConcto,
              actions: <Widget>[
          IconButton(
            icon:Image.asset('assets/QR.png'),
            tooltip: 'configuracion ',
            onPressed: () {
                  //getInfoIp();
                   
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
              scan();
                searchCotrolador.text=barcode;
              /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScanScreen(),
                  )
                // print("este es el nivel de señal $senal");
              );*/
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

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
      searchCotrolador.text=barcode;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
 
  

}

final  searchCotrolador=TextEditingController();

Widget barraConcto = TextField(
  controller: searchCotrolador,
  style: TextStyle(fontSize: 15),
  decoration: InputDecoration(
    hintText: "Search",
    prefixIcon: Icon(Icons.search),
  ),
);

//