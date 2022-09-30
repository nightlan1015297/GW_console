import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serial_port_win32/serial_port_win32.dart';

import '../../logic/bloc/port_console_page_bloc.dart';

class PortConsolePage extends StatefulWidget {
  const PortConsolePage({super.key, required this.portInstance});

  final SerialPort portInstance;

  @override
  State<PortConsolePage> createState() => _PortConsolePageState();
}

class _PortConsolePageState extends State<PortConsolePage> {
  late PortConsolePageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = PortConsolePageBloc(portInstance: widget.portInstance);
    bloc.add(InitializeRequest());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        body: BlocBuilder<PortConsolePageBloc, PortConsolePageState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) => Text(state.messages[index]));
          },
        ),
      ),
    );
  }
}
