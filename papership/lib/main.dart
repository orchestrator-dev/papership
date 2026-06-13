import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'app/router.dart';
import 'injection_container.dart';
import 'package:workmanager/workmanager.dart';
import 'core/worker/background_upload_worker.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'features/settings/presentation/bloc/settings_cubit.dart';
import 'features/settings/presentation/bloc/settings_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
  );

  await configureDependencies();
  Workmanager().initialize(
    callbackDispatcher,
  );
  runApp(const PapershipApp());
}

class PapershipApp extends StatelessWidget {
  const PapershipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        const defaultSeed = Color(0xFF1565C0);

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: defaultSeed,
            brightness: Brightness.light,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: defaultSeed,
            brightness: Brightness.dark,
          );
        }

        return BlocProvider(
          create: (_) => sl<SettingsCubit>()..checkBiometrics(),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, settingsState) {
              return MaterialApp.router(
                title: 'Papership',
                theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: lightColorScheme,
                ),
                darkTheme: ThemeData(
                  useMaterial3: true,
                  colorScheme: darkColorScheme,
                ),
                themeMode: settingsState.themeMode,
                routerConfig: appRouter,
              );
            },
          ),
        );
      },
    );
  }
}
