import 'package:flutter_modular/flutter_modular.dart';
import 'package:resistor_app/presentation/blocs/resistor_bloc/resistor_bloc.dart';
import 'package:resistor_app/presentation/screens/home_screen.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<ResistorBloc>(
      ResistorBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomeScreen());
  }
}
