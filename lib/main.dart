import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sample/screens/register_screen.dart';
import 'package:standalone_pkg/domain/model/remote_config.dart';
import 'package:standalone_pkg/domain/repository/firebase_configuration_repository_impl.dart';
import 'package:standalone_pkg/domain/repository/firebase_register_repository_impl.dart';
import 'package:standalone_pkg/domain/usecase/get_config_usecase.dart';
import 'package:standalone_pkg/domain/usecase/register_usecase.dart';
import 'package:standalone_pkg/presentation/config_bloc/config_bloc.dart';
import 'package:standalone_pkg/presentation/register_bloc/register_bloc.dart';
import 'package:standalone_pkg/util/result.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
            create: (BuildContext context) => RegisterBloc(
                RegisterUseCase(FirebaseRegisterRepositoryImpl()))),
        BlocProvider<ConfigBloc>(
            create: (BuildContext context) => ConfigBloc(
                GetConfigUseCase(FirebaseRemoteConfigRepositoryImpl()))
              ..add(const RequestConfigurationEvent())),
      ],
      child: BlocConsumer<ConfigBloc, ConfigState>(
        listener: (context, state) {
          if (state.state == ConfigStateEnum.sucess) {
            FlutterNativeSplash.remove();
          } // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: RegisterScreen(
              color: state.result == null
                  ? "red"
                  : state.result is Success
                      ? ((state.result as Success).data as RemoteConfiguration)
                          .color
                      : "blue",
            ),
          );
        },
      ),
    );
  }
}
