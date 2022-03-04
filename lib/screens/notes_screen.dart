import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviles/database/database_notas.dart';

import '../models/notes_model.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  late DatabaseNotes dbNotes;

  void initState() {
    super.initState();
    dbNotes = DatabaseNotes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Notes'),
      ),
      body: FutureBuilder(
        future: dbNotes.getAllNotes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<NotesDAO>> snapshot) {
          return Text('Hola');
        },
      ),
    );
  }
}
