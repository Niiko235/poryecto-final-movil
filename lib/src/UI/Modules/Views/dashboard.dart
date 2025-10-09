import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_dashboard.dart';
import 'package:proyecto_final_movil/src/Data/Local/research_local_list.dart';
// Asegúrate de que las rutas de importación sean correctas
// import 'package:proyecto_final_movil/Global/Widgets/card_dashboard.dart';
// import 'package:proyecto_final_movil/src/Data/Local/research_local_list.dart';

// Definición de colores para replicar el mockup
const Color primaryColor = Color(0xFF00796B); // Verde oscuro para el header

// --- CLASE DEL WIDGET DEL DASHBOARD (Dashboard) ---

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold principal que contendrá el fondo curvado y el contenido
    return const Scaffold(
      body: Stack(
        children: [
          // 1. Fondo Curvado (Header verde oscuro)
          _CurvedHeaderBackground(),

          // 2. Contenido Principal (AppBar y Lista de Estudios)
          _DashboardContent(),
        ],
      ),
    );
  }
}

// --- WIDGET PARA EL FONDO CURVADO ---

class _CurvedHeaderBackground extends StatelessWidget {
  const _CurvedHeaderBackground();

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return Container(
      // Altura fija o relativa (aquí, aproximadamente 25% de la altura total)
      height: size.height * 0.23,
      width: size.width,
      decoration: const BoxDecoration(
        color: primaryColor,
        // Aplica el borde redondeado solo en la parte inferior
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(250),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row para el título y el ícono de perfil (como en el mockup)
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: primaryColor,
                  ), // Ícono de perfil
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Alas Del Saber',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Estudios y monitoreos',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Subtexto de descripción
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Revisa y dale seguimiento a los diferentes\nestudios publicados en nuestra paltaforma',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET DEL CONTENIDO (ListView y Título de Estudios) ---

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    // La lista comienza debajo del header curvado.
    // Usamos Padding para crear el espacio superior.
    return Padding(
      padding: const EdgeInsets.only(
        top: 160,
      ), // Ajusta este valor según la altura del header
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título "All studies"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: Text(
              'All studies',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // La lista deslizable con el FutureBuilder
          Expanded(child: _listaJson()),
        ],
      ),
    );
  }
}

// --- WIDGET LISTA JSON (Integración de tu FutureBuilder) ---

// Cambiamos el nombre para seguir las convenciones de Flutter (empieza con mayúscula)

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

Widget _listaJson() {
  return FutureBuilder(
    future: listJsonProvider.futureList,

    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if (snapshot.hasData) {
        return ListView(children: _listItemsJson(snapshot.data ?? [], context));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}
