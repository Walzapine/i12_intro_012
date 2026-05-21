import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';
import 'package:i12_into_012/screens/settings_screen.dart';
import 'package:i12_into_012/screens/todo_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(refAppState);
    return Builder(
      builder: (context) {
        return ProviderScope(
          child: MaterialApp(
            title: 'ToDo App',
            theme: ThemeData(
              
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light,),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey, brightness: Brightness.dark,)
            ),
            themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: TodoListScreen(),
            routes: <String, WidgetBuilder>{
              "settings":  (context) => SettingsScreen(),
              
            }
          ),
        );
      }
    );
  }
}


