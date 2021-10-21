import 'package:examen_unidad_2/src/providers/catalogo_provider.dart';
import 'package:examen_unidad_2/src/providers/usuario_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Se prepara la clase y crea el estado
class PantallaCarrito extends StatefulWidget {
  @override
  _EstadoPantallaCarrito createState() => _EstadoPantallaCarrito();
}

//Metodo que crea estado y el contenido para la pantalla de carrito
class _EstadoPantallaCarrito extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    final _proveedorUsuario = Provider.of<UsuarioProvider>(context);
    final _proveedorCatalogo = Provider.of<CatalogoProvider>(context);

    return Scaffold(
        appBar: AppBar(
          //Creando sección de titulo de la pantalla
          title: Text('Carrito'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                //Se crea una lista de los productos seleccionados en el catalogo
                itemCount: _proveedorCatalogo.catalogo.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text('${_proveedorCatalogo.catalogo[index].nombre}'
                      .toUpperCase()),
                  trailing: Text(
                      '\$${_proveedorCatalogo.catalogo[index].precio.toStringAsFixed(2)}'),
                ),
              ),
            ),
            Container(
              //Crea un espacio que indica el nombre del usuario al final de pantalla
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('${_proveedorUsuario.nombreusuario}')],
              ),
            ),
          ],
        ));
  }
}
