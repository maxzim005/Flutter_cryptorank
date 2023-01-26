import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      // margin: ,
      appBar: AppBar(
        title: Text('To Do list'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Main Screen', style: TextStyle(color: Colors.white)),
          ElevatedButton(onPressed: () {
            // Navigator.pushNamed(context, '/todo');
            Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => true);
            // Navigator.pushReplacementNamed(context, '/todo');
          }, child: Text('Go ahead'))
        ],
      ),
    );
  }
}
