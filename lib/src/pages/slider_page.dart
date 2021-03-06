import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 200.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página con Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo.shade300,
      label: "Tamaño de la imagen",
      divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _checkbox() {
    // return Checkbox(

    //  value: _bloquearCheck,
    //  onChanged: (valor) {
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   }
    // );
    return CheckboxListTile(
        title: Text("Bloquear Slider"),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text("Bloquear Slider(switch)"),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          "https://www.notebookcheck.org/fileadmin/Notebooks/News/_nc3/maxresdefault47.jpg"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

}
