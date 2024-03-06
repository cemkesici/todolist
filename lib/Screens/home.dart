import 'package:flutter/material.dart';
import 'package:todolist/Screens/settings.dart';
import 'package:todolist/Screens/todoadd_page.dart';
import 'package:todolist/constans/colors.dart';

import '../util/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List toDoList = [];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
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
              toDoList.add([result, false]);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(color: normalYellow),
        child: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
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
