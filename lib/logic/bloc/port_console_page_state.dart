part of 'port_console_page_bloc.dart';

class PortConsolePageState extends Equatable {
  const PortConsolePageState({this.messages = const []});

  final List<String> messages;

  PortConsolePageState copyWith({List<String>? messages}) {
    return PortConsolePageState(messages: messages ?? this.messages);
  }

  @override
  List<Object?> get props => [messages];
}
