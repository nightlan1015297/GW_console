import 'package:flutter/material.dart';
import 'package:serial_port_win32/serial_port_win32.dart';
import 'package:gw_console/ui/port_information_page/PortConfigEditor.dart';

class PortConfigPage extends StatelessWidget {
  const PortConfigPage({super.key, required this.portName});

  final String portName;

  @override
  Widget build(BuildContext context) {
    final portInstance = SerialPort(portName);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 400),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
          child: Card(child: PortConfigEditForm(portInstance: portInstance)),
        ),
      ),
    );
  }
}
