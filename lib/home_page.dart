import 'package:flutter/material.dart';
import 'package:notes_app/edit_notes.dart';
import 'package:notes_app/sql_database.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlDb sqlDb = SqlDb();
  List<Map> notes = [];

  bool dataIsReady = false;

  void getData() async {
    List<Map> response = await sqlDb.readData('SELECT * FROM notes');
    notes.addAll(response);
    dataIsReady = true;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "add notes");
        },
      ),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: dataIsReady == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text("${notes[index]["title"]}"),
                          subtitle: Text("${notes[index]["note"]}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditNotes(
                                          note: notes[index]["note"],
                                          title: notes[index]["title"],
                                          color: notes[index]["color"],
                                          id: notes[index]["id"])));
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  int response = await sqlDb.deleteData(
                                      'DELETE FROM notes WHERE id = ${notes[index]["id"]}');
                                  if (response > 0) {
                                    setState(() {
                                      notes.removeWhere((element) =>
                                          element["id"] == notes[index]["id"]);
                                    });
                                  }
                                },
                              ),
                            ],
                          )),
                    );
                  },
                  itemCount: notes.length,
                )
              ],
            )),
    );
  }
}
