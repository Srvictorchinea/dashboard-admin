import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Ancho del menú de configuraciones
      color: Colors.white, // Color de fondo del menú
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Mi cuenta'),
            onTap: () {
              // Lógica para ir a la página de la cuenta
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuraciones'),
            onTap: () {
              // Lógica para ir a la página de configuraciones
            },
          ),
          // Agrega más opciones de menú según sea necesario
        ],
      ),
    );
  }
}
