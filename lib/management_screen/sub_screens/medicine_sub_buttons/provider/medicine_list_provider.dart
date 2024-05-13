import 'package:flutter/material.dart';
import 'package:pharmanode_pos/management_screen/sub_screens/medicine_sub_buttons/model/medicine_list_model.dart';


class MedicineProvider extends ChangeNotifier {
  List<Medicine> _medicines = [];

  List<Medicine> get medicines => _medicines;

  void addMedicine(Medicine medicine) {
    _medicines.add(medicine);
    notifyListeners();
  }

  void deleteMedicine(Medicine medicine) {
    _medicines.remove(medicine);
    notifyListeners();
  }

  void updateMedicine(Medicine medicine, String newName) {
    // Find the index of the medicine in the list
    final index = _medicines.indexOf(medicine);
    if (index != -1) {
      // Update the medicine name
      _medicines[index].name = newName;
      notifyListeners();
    }
  }
}
