import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';

class StorageService {

  void saveAppState(AppState state) {
    //todo implement
  }

  AppState loadAppState() => AppState(
    todos: [
      Todo(
        id: 'a',
        text: 'Zeug reinbringen',
        isCompleted: false,
      ),
      Todo(
        id: 'b',
        text: 'Hausaufgaben machen',
        isCompleted: true,
      ),
    ],
    isDarkMode: false,
    asksForDeletionConfirmation: true,
  );
}