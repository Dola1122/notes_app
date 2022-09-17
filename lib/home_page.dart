import 'package:flutter/material.dart';
import 'package:notes_app/sql_database.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: ()async {
                int response = await sqlDb.insertData("INSERT INTO notes (note) Values ('note one')");
                print(response);
              },
              child: Text(
                "Insert Data",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),            MaterialButton(
              onPressed: ()async {
                List<Map> response = await sqlDb.readData("SELECT * FROM notes");
                print(response);
              },
              child: Text(
                "Read Data",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: ()async {
                int response = await sqlDb.deleteData("DELETE FROM notes WHERE id = 8");
                print(response);
              },
              child: Text(
                "Delete Data",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: ()async {
                int response = await sqlDb.updateData("UPDATE notes SET note = 'updated note' WHERE id = 6");
                print(response);
              },
              child: Text(
                "Update Data",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
