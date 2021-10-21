import 'package:flutter/material.dart';

//Creación del modelo para usuarios para cambiar el nombre de usuario
class UsuarioProvider with ChangeNotifier {
  String _nombreusuario = 'Invitado';
  String get nombreusuario => _nombreusuario;

  void onChange(value) {
    //Evento para cambiar el nombre de usuario al cambiar el valor
    _nombreusuario = value;
    notifyListeners();
  }
}
