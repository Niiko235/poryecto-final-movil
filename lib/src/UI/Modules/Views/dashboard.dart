import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_dashboard.dart';
import 'package:proyecto_final_movil/src/Data/Local/research_local_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: _listaJson()));
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
      {
        print(items);
      }
      final tmpWidget = CardDashboard(data: items);
      listaJson
        ..add(Center(child: tmpWidget))
        ..add(SizedBox(height: 10));
    });

    return listaJson;
  }
}
