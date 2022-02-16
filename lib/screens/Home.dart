import 'package:flutter/material.dart';
import 'package:puzzle/view/color_chart.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Chart())),
        child: Text('SUBMIT',),
          
        ),
      ),
    );
  }
}
