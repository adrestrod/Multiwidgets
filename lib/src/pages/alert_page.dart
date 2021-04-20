import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Alert"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar alerta"),
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
            title: Text("Título del alert"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    "Este es el contenido del alert. Casi no tiene texto el pobre."),
                FlutterLogo(size: 100),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text("Cancelar"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ElevatedButton(
                child: Text("Aceptar"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }
}
