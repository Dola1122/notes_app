import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List myNotes = [
    {
      "note":
          "i love programming with python because it is the easiest programming language in the world",
      "image": "assets/notes.png"
    },    {
      "note":
          "i love programming with python because it is the easiest programming language in the world",
      "image": "assets/notes.png"
    },    {
      "note":
          "i love programming with python because it is the easiest programming language in the world",
      "image": "assets/notes.png"
    },    {
      "note":
          "i love programming with python because it is the easiest programming language in the world",
      "image": "assets/notes.png"
    },    {
      "note":
          "i love programming with python because it is the easiest programming language in the world",
      "image": "assets/notes.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: (context, index) => Dismissible(key: Key("$index"),
            child: ListNotes(myNotes[index])),
            itemCount: myNotes.length),
      ),
    );
  }
}

class ListNotes extends StatelessWidget {
  Map notes;

  ListNotes(this.notes);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(child: Image.asset(notes["image"]),
          flex: 1),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text("Title"),
              subtitle: Text("${notes["note"]}"),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
