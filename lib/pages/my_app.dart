// my_app.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_app_state.dart';
import 'home_page.dart';

// Clase principal de la aplicación 
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetAppState(),
      child: MaterialApp(
        title: 'AnimalKing',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
        // Modificar la AppBar predeterminada para agregar un logo
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0), // Aumentar el espacio superior
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo a la izquierda del título
                      Image.asset('assets/logo.png', width: 45),
                      // Título de la aplicación
                      SizedBox(width: 10), // Espacio entre el logo y el texto
                      Text('AnimalKing', style: TextStyle(fontSize: 35)),
                    ],
                  ),
                ),
              ),
            ),
            body: child,
          );
        },
      ),
    );
  }
}