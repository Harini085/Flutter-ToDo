import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> tasks = []; // List to store tasks
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("TO-DO LIST APP"),
            backgroundColor: Color.fromARGB(255, 4, 180, 196),
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter a Task",
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    MaterialButton(
                      color: Color.fromARGB(255, 192, 233, 229),
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        if (textController.text.isNotEmpty) {
                          setState(() {
                            tasks.add(textController.text); // Add task to list
                            textController.clear(); // Clear input field
                          });
                        }
                      },
                      child: Text("Add Task"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length, // Set the number of tasks
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Text(tasks[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                tasks.removeAt(index); // Remove task
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
