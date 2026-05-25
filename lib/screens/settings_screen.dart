import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(refAppState);
    final appStateNotifier = ref.watch(refAppState.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
      ),
      body: Column(
        children: [
          Text('..'),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'DarkMode',
                  ),
                ),
                Switch(
                  value: appState.isDarkMode,
                  onChanged: (bool newValue) {
                    appStateNotifier.toggleDarkmode();
                  },
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: Text('Löschen bestätigen'),
                ),
                Switch(
                  value: appState.asksForDeletionConfirmation,
                  onChanged: (bool newValue) {
                    appStateNotifier.toggleDeletionConfirmation();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
