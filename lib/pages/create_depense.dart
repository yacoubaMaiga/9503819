import 'dart:convert';

import 'package:devoir/models/Depense.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateDepense extends StatefulWidget {
  const CreateDepense({super.key});

  @override
  State<CreateDepense> createState() => _CreateDepenseState();
}

class _CreateDepenseState extends State<CreateDepense> {
  TextEditingController montantController = TextEditingController();
  TextEditingController categorieController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Depense depense = Depense(
    montant: 0,
    categorie: "",
    description: "",
    date: DateTime.now(),
  );
  // var data = [
  //   Depense(
  //     montant: 20000,
  //     categorie: "categorie",
  //     description: "description",
  //     date: DateTime.now(),
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
    // _loadSavedValue();
  }

  // Function to load saved value from SharedPreferences
  // void _loadSavedValue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _value = prefs.getString(_key) ?? "";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle dépense", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 55, 69, 79),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 40, color: Colors.green),
            onPressed: () => _saveValue(),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                controller: montantController,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                  suffixText: 'Fcfa',
                  hintText: '0',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le montant';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: categorieController,
                decoration: const InputDecoration(
                  labelText: 'Catégorie',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez choisir une catégorie';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la date';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      depense.montant as String,
      montantController.text as int,
    );
    await prefs.setString(depense.categorie, categorieController.text);
    await prefs.setString(depense.description, descriptionController.text);
    await prefs.setString(depense.date as String, dateController.text);
  }
}
