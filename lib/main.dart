import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: todoApp(),
        title: 'To Do App',

      theme: ThemeData(
        primarySwatch: Colors.blue,

        // Global ElevatedButton style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 4,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

      ),
    );

  }
}

class todoApp extends StatefulWidget {
  const todoApp({super.key});

  @override
  State<todoApp> createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  List<Map<String,String>> todos = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();



  // void addTodo() {
  //   setState(() {
  //     todos.add({
  //       'title': title_Controller.text,
  //       'subtitle': static_Controller.text
  //     })
  //
  //   });
  // }

  void addTodo() {
    if (titleController.text.isNotEmpty || subtitleController.text.isNotEmpty) {
      setState(() {
        todos.add({
          'title': titleController.text,
          'subtitle': subtitleController.text,
        });
        titleController.clear();
        subtitleController.clear();
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: subtitleController,
                  decoration: InputDecoration(
                    labelText: 'Subtitle',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      addTodo();
                    },
                    child: Text('Add'),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(todos[index]['title'] ?? ''),
                        subtitle: Text(todos[index]['subtitle'] ?? ''),
                      trailing: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.delete, color: Colors.red,),
                      ),
                      leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, color: Colors.green,))
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
