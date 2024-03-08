import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/Screens/settings.dart';
import 'package:todolist/Screens/todoadd_page.dart';
import 'package:todolist/constans/colors.dart';
import 'package:todolist/data/database.dart';

import '../util/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // reference the hivebox
  final _myBox = Hive.box("myBox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void deleteFunction(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = drawerbuild(context);
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        backgroundColor: softYellow,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: softYellow,
        onPressed: () async {
          final result = await showDialog<String>(
            context: context,
            builder: (BuildContext context) => const AlertDialog(
              backgroundColor: normalYellow,
              content: SizedBox(
                width: 450,
                height: 250,
                child: TodoPage(),
              ),
            ),
          );
          if (result != null && result != 'Cancel') {
            setState(() {
              db.toDoList.add([result, false]);
            });
            db.updateDatabase();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(color: normalYellow),
        child: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (context) => deleteFunction(index),
            );
          },
        ),
      ),
    );
  }

  Drawer drawerbuild(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow[200],
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.handshake,
              size: 48,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 24,
            ),
            title: const Text(
              'H O M E',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 24,
            ),
            title: const Text(
              'S E T T İ N G S',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
