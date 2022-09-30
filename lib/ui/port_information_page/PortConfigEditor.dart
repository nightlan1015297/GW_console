import 'package:flutter/material.dart';
import 'package:win32/src/constants.dart';
import 'package:flutter/services.dart';
import 'package:serial_port_win32/serial_port_win32.dart';
import 'package:gw_console/utilities/routes/route_args.dart';

class PortConfigEditForm extends StatefulWidget {
  const PortConfigEditForm({super.key, required this.portInstance});

  final SerialPort portInstance;

  @override
  State<PortConfigEditForm> createState() => _PortConfigEditFormState();
}

class _PortConfigEditFormState extends State<PortConfigEditForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Connection configuration :'),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        widget.portInstance.BaudRate = int.parse(value!);
                      },
                      decoration:
                          const InputDecoration(labelText: "Baud rate: "),
                      initialValue: 9600.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null) {
                          final parsedValue = int.tryParse(value);
                          if (parsedValue != null || parsedValue != -1) {
                            return null;
                          }
                        }
                        return 'Invalid value for baud rate.';
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextFormField(
                      onSaved: (value) {
                        widget.portInstance.ByteSize = int.parse(value!);
                      },
                      decoration:
                          const InputDecoration(labelText: "Data bits: "),
                      initialValue: 8.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null) {
                          final parsedValue = int.tryParse(value);
                          if (parsedValue != null || parsedValue != -1) {
                            return null;
                          }
                        }
                        return 'Invalid value for data bits.';
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    DropdownButtonFormField(
                      onSaved: (value) {
                        switch (value) {
                          case 'None':
                            widget.portInstance.Parity = NOPARITY;
                            break;
                          case 'Odd':
                            widget.portInstance.Parity = ODDPARITY;
                            break;
                          case 'Even':
                            widget.portInstance.Parity = EVENPARITY;
                            break;
                          case 'Mark':
                            widget.portInstance.Parity = MARKPARITY;
                            break;
                          case 'Space':
                            widget.portInstance.Parity = SPACEPARITY;
                            break;
                        }
                      },
                      decoration: const InputDecoration(labelText: "Parity: "),
                      value: 'None',
                      onChanged: (item) {},
                      items: const [
                        DropdownMenuItem(
                          value: 'None',
                          child: Text('None'),
                        ),
                        DropdownMenuItem(
                          value: 'Odd',
                          child: Text('Odd'),
                        ),
                        DropdownMenuItem(
                          value: 'Even',
                          child: Text('Even'),
                        ),
                        DropdownMenuItem(
                          value: 'Mark',
                          child: Text('Mark'),
                        ),
                        DropdownMenuItem(
                          value: 'Space',
                          child: Text('Space'),
                        ),
                      ],
                    ),
                    TextFormField(
                      onSaved: (value) {
                        widget.portInstance.StopBits = int.parse(value!);
                      },
                      decoration:
                          const InputDecoration(labelText: "Stop bits: "),
                      initialValue: 1.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null) {
                          final parsedValue = int.tryParse(value);
                          if (parsedValue != null || parsedValue != -1) {
                            return null;
                          }
                        }
                        return 'Invalid value for stop bits.';
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/console',
                  arguments:
                      PortConsolePageArgs(portInstance: widget.portInstance),
                );
              },
              child: const Text('Connect'),
            )
          ],
        ),
      ),
    );
  }
}
