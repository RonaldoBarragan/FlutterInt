import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegistroUsuario extends StatelessWidget {
  const RegistroUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formkey = GlobalKey<FormState>();
  // CONTROLADORES
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final  phoneController = TextEditingController();
  final passwordController = TextEditingController();


  //variables del sistema
  String rol = 'Usuario';
  //final List<String> rol = ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4'];
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de Usuario"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const Icon(
                Icons.account_circle,
                size: 120,
               color: Colors.lightBlue,
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(
                  labelText: "Nombre Usuario",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller:  emailController,
                keyboardType:  TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo Electronico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)

                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Telefono',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)
                ),

              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)
                ),

              ),
              const SizedBox(height: 20,),
              DropdownButtonFormField(
                value: rol,
                decoration: const InputDecoration(
                  labelText: 'Rol',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                  value: 'Usuario',
                  child:  Text('Usuario')
                  
                  ),
                  DropdownMenuItem(
                  value: 'Cliente',
                  child:  Text('Cliente')
                  
                  ),
                  DropdownMenuItem(
                  value: 'Administrador',
                  child:  Text('Administrador')
                  
                  )
                  
                ],
                onChanged: (value){
                  setState(() {
                    rol = value!;
                  });
                },
                
              ),
            ],
          ),
        ),
      ),
    );
  }
} 