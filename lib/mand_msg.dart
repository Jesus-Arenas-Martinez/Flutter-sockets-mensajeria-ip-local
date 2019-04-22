import 'package:flutter/material.dart';
import 'package:wifi/wifi.dart';

class AddcajaTex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          
         primaryColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Cajatext(),
    );
  }
}
//creacion de MMEtos Crete stat
class Cajatext extends StatefulWidget{
  _MyApp1 createState() => _MyApp1();
  

}

class _MyApp1 extends State<Cajatext>{
  String ip="";
  String ssid="";
  int senal=0;
  getInfoIp() async{
 

  try {
     ip = await Wifi.ip; 
    print("ests es mi direccion ip $ip");
  } catch (e) {
   ip ="Error";
   }
  setState(() => ip);
  
}

getInofoSsid() async{
  try {
    ssid=await Wifi.ssid;
  } catch (e) {
    ssid="Error";
  }
  setState(() => ssid);
}

  
    List <String>litems=[]; //Scorl pra mostrar los msj infinitos 
  /*@override
  void dispose(){
    miCotrolador.dispose();
    super.dispose();
  }*/
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            
            UserAccountsDrawerHeader(
              accountEmail: Text(ssid),
              accountName: Text("mi user"),
            ),
            RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text(
                      "Info Red",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      getInfoIp();
                      getInofoSsid();
                      
                    }),
                    Text("Es el Nombre de tu red: $ssid"),
                    Text("esta es tu direccio ip: $ip" ),
                    
          ],
        ),
      ),
      appBar: AppBar(
        
        
        title: Text("Mensajes Tesjo"),
      actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'configuracion ',
            onPressed: () {
                  
                  
                 // print("este es el nivel de señal $senal");
           
            },
          ),
      ],
        
      ),
    
      body: Container(
        
       child:Column(
         
         children: <Widget>[
         
          Expanded(
             child:ListView.builder(
    padding: EdgeInsets.all(16.0),
    itemExtent: 35.0,
    itemCount: litems.length,
    itemBuilder: (BuildContext context, int index) {
    return Container(
            margin: EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                
                borderRadius:  new BorderRadius.circular(20.0),
                color: Color (0xFFfeb800),
              ),
            child:Text(
            litems[index],      
            style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            
            
            
          ),
          
            ),
            ); 
            
  },
            
),
) ,
            
          Row(
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.send),
            tooltip: 'Boton de envio ',
            onPressed: () {
            
              if (miCotrolador.text !=""){
              litems.add(miCotrolador.text);  // Append Text to the list
              miCotrolador.clear();     // Clear the Text area
              setState(() {});
              }
            },
          ),
          
        Expanded(
           child: texto,
           
            
          
        ),
        
         
      ],
    ),
           apbaBaja,
         ],
       )
      ),
    );
  }
}
Widget apbaBaja =AppBar(
      
      );
  String lp="hola.--";
  int tambar=0;
  //-------brecion de barra  dinamica 




  // ----- fin de barra  dinamica 

 /*Widget barraINg =ListView.builder(
  padding: EdgeInsets.all(8.0),
  itemExtent: 40.0,
  itemCount: litems.length,
  itemBuilder: (BuildContext context, int index) {
    return Text(litems[index]);
  },
);*/


// definicio de var para recuperacion de informacion del sitema 

final  miCotrolador=TextEditingController();


Widget texto = TextField(
           controller:miCotrolador ,
           decoration: InputDecoration(
             
             fillColor: Colors.green,
              hintText: "Escriva su mensaje ",
              //labelText: 'Ingrese su Mensaje'
           ),
         );

