// edit_pet_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_app_state.dart';
import '../models/pet.dart';

class EditPetPage extends StatefulWidget {
  final Pet pet;

  EditPetPage({required this.pet});

  @override
  EditPetPageState createState() => EditPetPageState();
}

class EditPetPageState extends State<EditPetPage> {
  late TextEditingController nameController;
  late TextEditingController typeController;
  late TextEditingController ownerNameController;
  late TextEditingController ownerIdController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.pet.name);
    typeController = TextEditingController(text: widget.pet.type);
    ownerNameController = TextEditingController(text: widget.pet.ownerName);
    ownerIdController = TextEditingController(text: widget.pet.ownerId);
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PetAppState>();
    return Scaffold(
      appBar: AppBar(title: Text('Editar Mascota')),
      body: Padding(
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
              decoration: InputDecoration(labelText: 'Identificación del dueño'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var newName = nameController.text;
                var newType = typeController.text;
                var newOwnerName = ownerNameController.text;
                var newOwnerId = ownerIdController.text;
                if (newName.isNotEmpty && newType.isNotEmpty && newOwnerName.isNotEmpty && newOwnerId.isNotEmpty) {
                  var updatedPet = Pet(
                    id: widget.pet.id,
                    name: newName,
                    type: newType,
                    ownerName: newOwnerName,
                    ownerId: newOwnerId,
                  );
                  appState.updatePet(updatedPet);
                  Navigator.pop(context);
                }
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
