part of 'port_console_page_bloc.dart';

abstract class PortConsolePageEvent extends Equatable {
  const PortConsolePageEvent();

  @override
  List<Object> get props => [];
}

class InitializeRequest extends PortConsolePageEvent {}

class AppendOutputRequest extends PortConsolePageEvent {
  final Uint8List data;

  const AppendOutputRequest({required this.data});
}
