import 'package:flutter/material.dart';
import 'package:todolist/constans/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      backgroundColor: normalYellow,
      appBar: AppBar(title: const Text("Settings Page"),backgroundColor: softYellow,), 
      body: const Center(
      ),
    );
  }
}
