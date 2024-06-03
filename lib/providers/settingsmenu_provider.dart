import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SettingsMenuProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isOpen = false;

  static void initialize() {
    final tickerProvider = MyTickerProvider();
    menuController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(milliseconds: 0), // Establece la duración a 0 para que no haya transición
    );
  }

  static Animation<double> movement =
      Tween<double>(begin: -200, end: 0).animate(menuController); // Ajusta el valor de begin

  static Animation<double> opacity =
      Tween<double>(begin: 0, end: 1).animate(menuController); // Transparencia sin cambios

  static void openMenu() {
    isOpen = true;
    menuController.value = 1.0; // Establece el valor del controlador a 1 para mostrar el menú inmediatamente
  }

  static void closeMenu() {
    isOpen = false;
    menuController.value = 0.0; // Establece el valor del controlador a 0 para ocultar el menú inmediatamente
  }

  static void toggleMenu() {
    isOpen ? menuController.reverse() : menuController.forward();
    isOpen = !isOpen;
  }
}


class MyTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
