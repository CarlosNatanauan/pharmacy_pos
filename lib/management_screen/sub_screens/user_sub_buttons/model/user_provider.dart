import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = []; // Initialize an empty list of users

  // A getter to provide an unmodifiable view of the list of users
  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  // Method to add a new user
  void addUser(User user) {
    _users.add(user); // Add the user to the list
    notifyListeners(); // Notify listeners that the data has changed
  }


  // Other methods to get cashiers and store managers
  List<User> getCashiers() {
    return _users.where((user) => user.role == 'Cashier').toList();
  }

  List<User> getStoreManagers() {
    return _users.where((user) => user.role == 'Store Manager').toList();
  }

  // Method to delete a user
  void deleteUser(User user) {
    _users.remove(user); // Remove the user from the list
    notifyListeners(); // Notify listeners that the data has changed
  }
}
