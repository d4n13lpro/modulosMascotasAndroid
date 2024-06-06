// add_pet_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_app_state.dart';
import '../models/pet.dart';

class AddPetPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PetAppState>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre de la mascota'),
            ),
            TextField(
              controller: typeController,
              decoration: InputDecoration(labelText: 'Tipo de mascota'),
            ),
            TextField(
              controller: ownerNameController,
              decoration: InputDecoration(labelText: 'Nombre del dueño'),
            ),
            TextField(
              controller: ownerIdController,
              decoration:
                  InputDecoration(labelText: 'Identificación del dueño'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var name = nameController.text;
                var type = typeController.text;
                var ownerName = ownerNameController.text;
                var ownerId = ownerIdController.text;
                if (name.isNotEmpty &&
                    type.isNotEmpty &&
                    ownerName.isNotEmpty &&
                    ownerId.isNotEmpty) {
                  var pet = Pet(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: name,
                    type: type,
                    ownerName: ownerName,
                    ownerId: ownerId,
                  );
                  appState.addPet(pet);
                  nameController.clear();
                  typeController.clear();
                  ownerNameController.clear();
                  ownerIdController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Mascota agregada: $name'),
                  ));
                }
              },
              child: Text('Agregar Mascota'),
            ),
          ],
        ),
      ),
    );
  }
}