import 'package:examen_unidad_2/src/models/producto_modelo.dart';
import 'package:flutter/material.dart';

class CatalogoProvider with ChangeNotifier {
  List<ProductoModelo> _catalogo =
      []; //Declaración de la lista que alamcenará los productos.
  List<ProductoModelo> get catalogo =>
      _catalogo; //Variable para llamar los valores de la lista.

  void agregarACatalogo(ProductoModelo productoModelo) {
    //Método para añadir un producto a la lista del catálogo.
    _catalogo.add(productoModelo);
    notifyListeners();
  }

  void borrarDelCatalogo(ProductoModelo productoModelo) {
    //Método para eliminar un producto de la lista del catálogo.
    _catalogo.remove(productoModelo);
    notifyListeners();
  }
}
