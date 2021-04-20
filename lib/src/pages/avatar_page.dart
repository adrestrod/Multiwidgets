import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Avatar"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.cinemascomics.com/wp-content/uploads/2018/02/stan-lee-enfermedad.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
          child: FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/9/90/Spiderman.JPG"  
                ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
