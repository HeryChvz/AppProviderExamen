import 'package:examen_unidad_2/src/pages/carrito.dart';
import 'package:examen_unidad_2/src/pages/catalogo.dart';
import 'package:examen_unidad_2/src/pages/usuario.dart';
import 'package:examen_unidad_2/src/providers/catalogo_provider.dart';
import 'package:examen_unidad_2/src/providers/usuario_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      //Creamos los controladores de los diferentes proveedores de la aplicación
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
        ChangeNotifierProvider(create: (_) => CatalogoProvider())
      ],
      child: MyApp(), //Mandamos a la clase MyApp como hijo
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Unidad 2',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        //Definimos las rutas de las diversas pantallas de la aplicación
        '/': (context) => PantallaCatalogo(),
        '/usuario': (context) => PantallaUsuario(),
        '/carrito': (context) => PantallaCarrito(),
      },
    );
  }
}
