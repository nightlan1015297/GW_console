import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gw_console/logic/bloc/avaliable_ports_page_bloc.dart';
import 'package:gw_console/utilities/routes/app_router.dart';

import 'ui/avaliable_ports_page/AvaliablePortsPage.dart';

void main() {
  runApp(const GWConsole());
}

class GWConsole extends StatelessWidget {
  const GWConsole({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AvaliablePortsPageBloc>(
          create: (BuildContext context) {
            final avaliablePortsPageBloc = AvaliablePortsPageBloc();
            avaliablePortsPageBloc.add(InitializeRequest());
            return avaliablePortsPageBloc;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Universal serial console',
        theme: ThemeData.dark(),
        onGenerateRoute: AppRouter().generateRoute,
        home: const AvaliablePortsPage(),
      ),
    );
  }
}
