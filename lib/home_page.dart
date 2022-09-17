import 'package:flutter/material.dart';
import 'package:notes_app/sql_database.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> getNotes() async {
    List<Map> notes = await sqlDb.readData('SELECT * FROM notes');
    return notes;
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
      body: Container(
          child: ListView(
        children: [
          // MaterialButton(
          //   onPressed: () async {
          //     //await sqlDb.deleteDb();
          //     List<Map> notes = await sqlDb.readData('SELECT * FROM notes');
          //     print(notes);
          //   },
          //   child: Text(
          //     "Delete Database",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   color: Colors.red,
          // ),
          FutureBuilder(
              future: getNotes(),
              builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title:
                              Text("${snapshot.data![index]["title"]}"),
                          subtitle:    Text("${snapshot.data![index]["note"]}"),
                          trailing:    Text("${snapshot.data![index]["color"]}"),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      )),
    );
  }
}
