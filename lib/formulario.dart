import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegistroUsuario extends StatelessWidget {
  const RegistroUsuario({super.key});

  @override
  Widget build(BuildContext context
  ) {
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
  
  DateTime? fechaNacimiento;
  //DateTime fecha = dateTime(2000, 1, 1) valor por defecto

  bool aceptaTerminos = false;
  bool notificaciones = false;


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
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
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
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Por favor, ingresa tu correo';
                  }
                  if (!RegExp(r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Ingresa un correo válido (ejemplo@dominio.com)';
                  }
                  return null;
                },
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
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Por favor, ingresa tu numero telefonico';
                  }
                  if (value.length <10){
                    return 'El telefonico debe tener al menos 10 caracteres';
                  }
                  return null;
                },

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
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Por favor, ingresa tu contraseña';
                  }
                  if (value.length <6){
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },

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
              const SizedBox(height: 20),

              SizedBox(
                width: double
                    .infinity, //espacio horizontal completo automáticamente

                child: ElevatedButton.icon(
                  icon: const Icon(Icons.calendar_month),

                  label: Text(
                    fechaNacimiento == null
                        ? 'Seleccionar Fecha de Nacimiento'
                        : 'Fecha: ${fechaNacimiento!.day}/${fechaNacimiento!.month}/${fechaNacimiento!.year}',
                  ),

                  onPressed: () async {
                    DateTime? fecha = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2027),
                    );

                    if (fecha != null) {
                      setState(() {
                        fechaNacimiento = fecha;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title:  const Text('Acepto los terminos y condiciones'),
                value: aceptaTerminos,
                //tristate: false,  
                onChanged: (value){
                  setState(() {
                    aceptaTerminos = value ?? false;
                  });
                },
              ),
              const SizedBox( height: 10,),
              SwitchListTile(title: const Text('Recibir notificaciones'),
              value: notificaciones
              
              , onChanged: (value){
                setState(() {
                  notificaciones = value;
                });

              }),
              const SizedBox( height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  if (_formkey.currentState!.validate() && aceptaTerminos){
                    print("Formulario valido");
                
                }
                    else {
                      print("Formulario incompleto, acepta los terminos");
                    }
                },
                 child: const Text('registrar')),
              )
              

            ],
          ),
        ),
      ),
    );
  }
} 