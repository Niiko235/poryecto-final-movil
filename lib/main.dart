import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:proyecto_final_movil/Global/Widgets/card_specie_point.dart';
import 'package:proyecto_final_movil/src/Data/Local/research_local.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   home: Scaffold(body: Center(child: CardSpeciePoint())),
    // );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("prueba informacion")),
        body: _listaJson(),
      ),
    );
  }

  Widget _listaJson() {
    return FutureBuilder(
      future: listJsonProvider.futureList,
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _listItemsJson(snapshot.data ?? [], context),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listItemsJson(List<dynamic> data, BuildContext context) {
    List<Widget> listaJson = [];

    data.forEach((items) {
      final tmpWidget = ListTile(
        title: Text(items['name']),
        leading: Icon(FontAwesomeIcons.icons),
        trailing: Icon(Icons.arrow_forward_ios),
        // onTap: () {
        //   Navigator.pushNamed(context, items["ruta"]);
        // },
      );
      listaJson
        ..add(tmpWidget)
        ..add(Divider());
    });

    return listaJson;
  }
}
