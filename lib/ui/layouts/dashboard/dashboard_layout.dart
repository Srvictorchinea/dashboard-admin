import 'package:flutter/material.dart';

import 'package:admin_dashboard/providers/settingsmenu_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:admin_dashboard/ui/shared/widgets/settings_menu.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // Cerrar el menú de configuraciones si está abierto
        if (SettingsMenuProvider.isOpen) {
          SettingsMenuProvider.closeMenu();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffEDF1F2),
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width >= 700) Sidebar(),
                Expanded(
                  child: Column(
                    children: [
                      // Navbar
                      Navbar(),

                      // View
                      Expanded(
                        child: Container(
                          child: widget.child,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Menú de configuraciones
          
              AnimatedBuilder(
                animation: SettingsMenuProvider.menuController,
                builder: (context, _) => Stack(
                  children: [
                    if (SettingsMenuProvider.isOpen)
                      Opacity(
                        opacity: SettingsMenuProvider.opacity.value,
                        child: GestureDetector(
                          onTap: () => SettingsMenuProvider.closeMenu(),
                          child: Container(
                            width: size.width,
                            height: size.height,
                            color: Colors.black26,
                          ),
                        ),
                      ),

                    Transform.translate(
                      offset:
                          Offset(SettingsMenuProvider.movement.value, 0),
                      child: SettingsMenu(),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
