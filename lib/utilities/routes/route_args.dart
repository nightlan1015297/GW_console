import 'package:serial_port_win32/serial_port_win32.dart';

class PortInformationPageArgs {
  PortInformationPageArgs({required this.portName});
  final String portName;
}

class PortConfigArgs {
  PortConfigArgs({required this.portName});
  final String portName;
}

class PortConsolePageArgs {
  PortConsolePageArgs({required this.portInstance});
  final SerialPort portInstance;
}
