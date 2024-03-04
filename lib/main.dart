import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> items = [];

  MainApp myApp = const MainApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To-Do List'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.map),
              title: Text(items[index]),
              subtitle: Text(items.length.toString()),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(57, 94, 89, 76),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          (items.add("value"));
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
