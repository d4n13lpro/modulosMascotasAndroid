// providers/pet_app_state.dart

import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetAppState extends ChangeNotifier {
  List<Pet> pets = []; // Lista de mascotas

  // Método para agregar una nueva mascota
  void addPet(Pet pet) {
    pets.add(pet); // Añadir la mascota a la lista
    notifyListeners(); // Notificar a los widgets que dependen de este estado
  }

  // Método para actualizar la información de una mascota existente
  void updatePet(Pet updatedPet) {
    var petIndex = pets.indexWhere((pet) => pet.id == updatedPet.id);
    if (petIndex != -1) {
      pets[petIndex] = updatedPet; // Actualizar la mascota en la lista
      notifyListeners(); // Notificar a los widgets que dependen de este estado
    }
  }

  // Método para eliminar una mascota existente
  void deletePet(String id) {
    pets.removeWhere((pet) => pet.id == id); // Eliminar la mascota de la lista
    notifyListeners(); // Notificar a los widgets que dependen de este estado
  }
}