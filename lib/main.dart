import 'package:flutter/material.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesHome(),
    );
  }
}

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {

  List<String> notes = [];

  TextEditingController controller =
      TextEditingController();

  void addNote() {

    if (controller.text.isNotEmpty) {

      setState(() {
        notes.add(controller.text);
      });

      controller.clear();
    }
  }

  void deleteNote(int index) {

    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Notes App"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller: controller,

              decoration: InputDecoration(
                hintText: "Enter note",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: addNote,
              child: Text("Add Note"),
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(

                itemCount: notes.length,

                itemBuilder: (context, index) {

                  return Card(

                    child: ListTile(

                      title: Text(notes[index]),

                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteNote(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
