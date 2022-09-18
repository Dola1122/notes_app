import 'package:flutter/material.dart';
import 'package:notes_app/sql_database.dart';

class EditNotes extends StatefulWidget {
  final String note;
  final String title;
  final String color;
  final int id;

  const EditNotes(
      {Key? key,
      required this.note,
      required this.title,
      required this.color,
      required this.id})
      : super(key: key);

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  SqlDb sqlDb = SqlDb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  void initState() {
    note.text = widget.note;
    title.text = widget.title;
    color.text = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
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
                    int response = await sqlDb.updateData(
                        'UPDATE notes SET note = "${note.text}", title = "${title.text}", color = "${color.text}" WHERE id = ${widget.id}');
                    if (response > 0) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "home page", (route) => false);
                    }
                  },
                  child: Text("Edit Note"))
            ],
          ),
        ),
      ),
    );
  }
}
