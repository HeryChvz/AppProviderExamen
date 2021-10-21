import 'package:examen_unidad_2/src/providers/usuario_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Creacion de la clase para crear el estado
class PantallaUsuario extends StatefulWidget {
  @override
  _PantallaUsuarioEstado createState() => _PantallaUsuarioEstado();
}

//Clase que contiene el contenido de la pantalla usuario
class _PantallaUsuarioEstado extends State<PantallaUsuario> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController(
        //Variable que controla cuando se edita el textbox
        text: context.read<UsuarioProvider>().nombreusuario);
  }

  @override
  Widget build(BuildContext context) {
    final _proveedorUsuario = Provider.of<UsuarioProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Usuario - ${_proveedorUsuario.nombreusuario}'), //Creacion de la parte del titulo indicando el usuario actual
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              //Creacion del campo de texto con algunas propiedades
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                labelText: 'Nombre Usuario',
              ),
              onChanged: (value) {
                //Evento que se ejecuta al cambiar el valor del textbox
                _proveedorUsuario.onChange(value);
              },
            )));
  }
}
