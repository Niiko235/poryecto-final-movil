import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_sampling_investigation.dart';
import 'package:proyecto_final_movil/src/Data/Local/research_local_project.dart';
// import 'card_dashboard.dart'; // asegúrate de importar tu widget

class Investigation extends StatelessWidget {
  final String uuid;

  const Investigation({super.key, required this.uuid});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  projectJsonProvider.getProjectByUuid(uuid),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: ListView(children: _listItemsJson(snapshot.data?['samplingPoints'] ?? [], context),),
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
      final tmpWidget = CardSamplingInvestigation(data: items);
      listaJson
        ..add(Center(child: tmpWidget))
        ..add(SizedBox(height: 10));
    });

    return listaJson;
  }
}
