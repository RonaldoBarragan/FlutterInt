import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demooo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('aplicacion prueba'),
        ),
        body: Center(
          //child: Column(mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
          //  Text('la mala', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 241, 1, 1))), 
          //    Text('qbo', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 5, 255, 68))), 
          //    Text('helou vv', style: TextStyle(fontSize: 20)),],
          //  ), 
          child: Container(
            width: 300,
            height: 300,
            // espacio interno del contenedor
            margin: const EdgeInsets.all(20),
            //color container
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20)
            ),
          //contenido del contenedor
          //filas
          child: Row(
            //espacio entre filas
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person,
                  color: Colors.white,
                  size: 50),
                  Text('Ronaldo', style:TextStyle(fontSize: 35, color: const Color.fromARGB(255, 255, 196, 2))),
                  Text ('BABA'),
                  Text('Telefono')
                ],
              )
              
            ]
          ),
          
          ),
        ),
        drawer: Drawer(),
        
      ),
    );
  }
}