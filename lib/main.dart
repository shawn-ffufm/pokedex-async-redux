import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokedex_app.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/state/persistor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final persistor = AppPersistor();
  var initialState = await persistor.readState();

  final store = Store<AppState>(
    initialState: initialState,
    persistor: persistor,
    actionObservers: [ConsoleActionObserver<AppState>()], /// TODO: this should be not present on the release mode
  );

  runApp(PokedexApp(store: store));
}
