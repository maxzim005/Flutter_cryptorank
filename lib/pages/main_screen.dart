import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      // margin: ,
      appBar: AppBar(
        title: Text('Тестовое задание. Андрианов Максим'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
            Text('Press button below to check page with exchanges.', style: TextStyle(color: Colors.white, fontSize: 30)),
            Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
            SizedBox(
              width: 130,
              height: 50,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/exchanges');
              }, child: Text('Go ahead', style: TextStyle(fontSize:20)))
            ),
          ],
        ),
      ),
    );
  }
}
