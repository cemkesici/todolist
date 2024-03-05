import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 193, 7),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
             Container(
                height: 190.0, // limit height
                child: TextField(
                  controller: _controller,
                  maxLines: null, 
                  scrollPhysics: BouncingScrollPhysics(), 
                  decoration: const InputDecoration(
                    labelText: 'Todo',
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    Navigator.pop(context, _controller.text);
                    Fluttertoast.showToast(
                        msg: "Todo added",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Todo not added",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
