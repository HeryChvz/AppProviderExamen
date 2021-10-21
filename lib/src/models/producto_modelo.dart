import 'package:meta/meta.dart';

class ProductoModelo {
  //Declaración de las propiedades de las clase del producto
  final int id;
  final String nombre;
  bool agregarcarrito;
  final double precio;

  //Constructor de la clase
  ProductoModelo({
    @required this.id,
    @required this.nombre,
    @required this.precio,
    this.agregarcarrito = false,
  });

  //Metodo que nos servirá para identificar el estado del producto para agregar o no agregarlo al carrito
  void togglerAdded() {
    agregarcarrito = !agregarcarrito;
  }
}
