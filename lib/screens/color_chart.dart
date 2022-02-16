import 'package:flutter/material.dart';
import 'package:puzzle/view/Home.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Color Chart'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())),
          child: Text('START',),

        ),
      ),
    );
  }
}
