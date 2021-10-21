import 'package:examen_unidad_2/src/models/producto_modelo.dart';
import 'package:examen_unidad_2/src/providers/catalogo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen_unidad_2/src/extras/productos.dart' as datosProductos;

//Creacion de la clase y el estado
class PantallaCatalogo extends StatefulWidget {
  @override
  _PantallaCatalogoState createState() => _PantallaCatalogoState();
}

//Creación de la clase que contiene el contenido de la pantalla
class _PantallaCatalogoState extends State<PantallaCatalogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Creación de la parte superior de la pantalla, con botones que dirigen a las otras pantallas de la app
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, '/usuario');
          },
        ),
        title: Text('Productos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_basket_rounded),
                Positioned(
                  right: -10,
                  top: -10,
                  child: CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    child: Text(
                      '${context.watch<CatalogoProvider>().catalogo.length}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    radius: 10.0,
                  ),
                )
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/carrito');
            },
          )
        ],
      ),
      body: Center(
        child: ListViewWidget(),
      ),
    );
  }
}

//Creación del constructor del widget tipo lista
class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    Key key,
  }) : super(key: key);

  @override
  _ListViewWidgetState createState() =>
      _ListViewWidgetState(); //Se crea el estado para la lista de productos
}

class _ListViewWidgetState extends State<ListViewWidget> {
  List<ProductoModelo> productos =
      []; //Se toma los productos existentes del archivo de productos

  @override
  void initState() {
    //Se inicia el estado con este método
    super.initState();
    datosProductos.listItems.forEach((element) => productos.add(ProductoModelo(
        id: element['id'],
        nombre: element['nombre'],
        precio: element['precio'])));
  }

  @override
  Widget build(BuildContext context) {
    //Con este código se crea toda la interfaz del catalogo
    final _catalogoProvider =
        Provider.of<CatalogoProvider>(context, listen: false);

    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
            //Aqui se crea el apartado de cada producto
            leading: AspectRatio(aspectRatio: 1),
            title: Text('${productos[index].nombre}'.toUpperCase()),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${productos[index].precio}'),
              ],
            ),
            trailing: IconButton(
              //Se crean iconos que invocan los metodos para agregar o quitar del carrito
              icon: productos[index].agregarcarrito
                  ? Icon(
                      Icons.remove_done,
                    )
                  : Icon(
                      Icons.add,
                    ),
              onPressed: () {
                if (productos[index].agregarcarrito) {
                  _catalogoProvider.borrarDelCatalogo(productos[index]);
                } else {
                  _catalogoProvider.agregarACatalogo(productos[index]);
                }

                setState(() {
                  productos[index].togglerAdded();
                });
              },
            )),
      ),
    );
  }
}
