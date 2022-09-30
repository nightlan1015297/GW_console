import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serial_port_win32/serial_port_win32.dart';

part 'port_console_page_event.dart';
part 'port_console_page_state.dart';

extension Encoder on String {
  Uint8List toUnit8List() {
    List<int> codeUnit = this.codeUnits;
    return Uint8List.fromList(codeUnit);
  }
}

class PortConsolePageBloc
    extends Bloc<PortConsolePageEvent, PortConsolePageState> {
  PortConsolePageBloc({required this.portInstance})
      : super(const PortConsolePageState()) {
    on<InitializeRequest>(_onInitializeRequest);
    on<AppendOutputRequest>(_onAppendOutputRequest);
  }
  final SerialPort portInstance;
  void _onInitializeRequest(
    InitializeRequest event,
    Emitter<PortConsolePageState> emit,
  ) {
    portInstance.readBytesOnListen(8, (value) => print(value));
    // portStream = reader.stream.listen((uint8Data) {
    //   print('add data');
    //   print(String.fromCharCodes(uint8Data));
    //   add(AppendOutputRequest(data: uint8Data));
    // });
    portInstance.writeBytesFromString('*IDN?\n');
  }

  void _onAppendOutputRequest(
    AppendOutputRequest event,
    Emitter<PortConsolePageState> emit,
  ) {
    emit(
      state.copyWith(
        messages: state.messages + [String.fromCharCodes(event.data)],
      ),
    );
  }

  @override
  Future<void> close() async {
    await super.close();
    portInstance.close();
  }
}
