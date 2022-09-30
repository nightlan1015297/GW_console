import 'package:flutter/material.dart';
import 'package:gw_console/ui/avaliable_ports_page/AvaliablePortsPage.dart';
import 'package:gw_console/ui/page_routes/popup_page_route.dart';
import 'package:gw_console/ui/port_console_page/PortConsolePage.dart';
import 'package:gw_console/ui/port_information_page/PortConfigPage.dart';
import 'package:gw_console/ui/port_information_page/PortInformationPage.dart';
import 'package:gw_console/utilities/routes/route_args.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings routsettings) {
    switch (routsettings.name) {
      case '/':
        return MaterialPageRoute(
          settings: RouteSettings(name: routsettings.name),
          builder: (contex) => const AvaliablePortsPage(),
        );
      case '/portConfig':
        return PopupPageRoute(
          settings: RouteSettings(name: routsettings.name),
          builder: (contex) {
            final args = routsettings.arguments as PortConfigArgs;
            return PortConfigPage(
              portName: args.portName,
            );
          },
        );
      case '/console':
        return PopupPageRoute(
          settings: RouteSettings(name: routsettings.name),
          builder: (contex) {
            final args = routsettings.arguments as PortConsolePageArgs;
            return PortConsolePage(
              portInstance: args.portInstance,
            );
          },
        );
      case '/portInformation':
        return PopupPageRoute(
          settings: RouteSettings(name: routsettings.name),
          builder: (contex) {
            final args = routsettings.arguments as PortInformationPageArgs;
            return PortInformationPage(
              portName: args.portName,
            );
          },
        );

      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: 'Route error'),
          builder: (contex) => Scaffold(
            body: Center(
              child: Text('Bad route for route name: ${routsettings.name}.'),
            ),
          ),
        );
    }
  }
}
