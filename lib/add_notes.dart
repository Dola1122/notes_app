import 'package:flutter/material.dart';
import 'package:notes_app/sql_database.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  SqlDb sqlDb = SqlDb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formState,
          child: Column(
            children: [
              TextFormField(
                controller: note,
                decoration: InputDecoration(hintText: "note"),
              ),
              TextFormField(
                controller: title,
                decoration: InputDecoration(hintText: "title"),
              ),
              TextFormField(
                controller: color,
                decoration: InputDecoration(hintText: "color"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    int response = await sqlDb.insertData(
                        'INSERT INTO notes(note, title, color) VALUES("${note.text}", "${title.text}", "${color.text}")');
                    if (response > 0) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "home page", (route) => false);
                    }
                  },
                  child: Text("Add Note"))
            ],
          ),
        ),
      ),
    );
  }
}
