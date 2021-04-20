import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Componentes de Flutter Temp"),
        ),
        body: ListView(
          children: _crearListaCorta(),

          //_crearLista(),
        ));
  }
  // Ejemplo de como crear Listas
  // List<Widget> _crearLista() {
  //   List<Widget> lista = [];

  //   for (String opt in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     lista..add( tempWidget )
  //     ..add(Divider());
  //   }

  //  return lista;
  // }

  List<Widget> _crearListaCorta() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + "!"),
            subtitle: Text("data"),
            leading: Icon(Icons.add_moderator),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
