// pet_list_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_app_state.dart';
import '../models/pet.dart';
import 'edit_pet_page.dart';

class PetListPage extends StatefulWidget {
  @override
  PetListPageState createState() => PetListPageState();
}

class PetListPageState extends State<PetListPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PetAppState>();

    List<Pet> filteredPets = appState.pets.where((pet) {
      var searchQuery = searchController.text.toLowerCase();
      return pet.name.toLowerCase().contains(searchQuery) ||
          pet.ownerName.toLowerCase().contains(searchQuery);
    }).toList();

    if (appState.pets.isEmpty) {
      return Center(
        child: Text('No tienes mascotas agregadas.', style: TextStyle(fontSize: 20)),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Buscar por nombre de mascota o dueño',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredPets.length,
            itemBuilder: (context, index) {
              var pet = filteredPets[index];
              return ListTile(
                leading: Icon(Icons.pets),
                title: Text('${pet.name} (${pet.type})'),
                subtitle: Text('Dueño: ${pet.ownerName}, ID: ${pet.ownerId}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPetPage(pet: pet),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Eliminar Mascota'),
                          content: Text('¿Estás seguro de que quieres eliminar a ${pet.name}?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                appState.deletePet(pet.id);
                                Navigator.of(context).pop();
                              },
                              child: Text('Eliminar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}