import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcionSeleccionada = "Volar";
  TextEditingController _inputFieldDatePicker = new TextEditingController();
  List<String> _poderes = ['Volar', 'Velocidad aumentada', 'Fuerza aumentada', 'Rayos térmicos'];
  String _contador = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        children: <Widget>[
          _crearInput(),
          Divider(thickness: 1.5,),
          _crearEmail(),
          Divider(thickness: 1.5,),
          _crearPassword(),
          Divider(thickness: 1.5,),
          _crearFecha(context),
          Divider(thickness: 1.5,),
          _crearDropdown(),
          Divider(thickness: 1.5,),

          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          counter: Text('Letras ${_contador.length}'),
          hintText: "Nombre",
          labelText: "Nombre",
          helperText: "Introduce tu nombre completo",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onSubmitted: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
      onChanged: (valor) {
        setState(() {
          _contador = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: "Email",
          labelText: "Email",
          helperText: "Introduce tu correo electronico",
          suffixIcon: Icon(Icons.mail),
          icon: Icon(Icons.account_circle)),
      onSubmitted: (valor) {
        setState(() {
          _email = valor;
        });
      }
    );
  }
  Widget _crearPassword () {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: "Contraseña",
          labelText: "Contraseña",
          helperText: "Introduce tu contraseña",
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.account_circle)),
    );
  }

  Widget _crearFecha (BuildContext context) {
    return TextField(
    enableInteractiveSelection: false,
    controller: _inputFieldDatePicker,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        ),
      hintText: "Fecha de nacimiento",
      labelText: "Fecha de nacimiento",
      helperText: "Introduce tu fecha de nacimiento",
      suffixIcon: Icon(Icons.calendar_today),
      icon: Icon(Icons.account_circle)),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );

  }
  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
      locale: Locale('es','ES'),
      );

      if (picked != null) {
        setState(() {
          _fecha = picked.toString();
          _fecha = _fecha.substring(0,10);
          _inputFieldDatePicker.text = _fecha;
        });
      }
  }
 
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) { 
      lista.add( DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
     });
     return lista;
  }

 Widget _crearDropdown(){
   return Row(
     children: [
       Icon(Icons.select_all),
       SizedBox(width: 30.0,),
       DropdownButton(
         value: _opcionSeleccionada,
         items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
         ),
     ],
   );
 }

  Widget _crearPersona() {
    return ListTile(
      title: Text("El nombre es: $_nombre"),
      subtitle: Text("El correo es: $_email"),
      leading: Text("Poder: $_opcionSeleccionada"),
    );
  }
}
