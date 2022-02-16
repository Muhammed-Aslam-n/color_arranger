import 'package:color_arranger/widget/common_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chart extends StatelessWidget {
  final ValueNotifier<List<Map<String, dynamic>>>? palletList;

  Chart({this.palletList, Key? key}) : super(key: key);
  final scoreList = [
    "78",
    "66",
    "59",
    "43",
    "36",
    "29",
    "17",
    "14",
    "9",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Your Score'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildColorPallet(index, palletList!.value[index]['name'][0],context, palletList!.value[index]['color']);
                    },
                    itemCount: palletList!.value.length,
                  ),
                ),
                SizedBox(height: 20.h,),
                CommonButton(
                  text: "START",
                  bgColor: Colors.green,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildColorPallet(index, url,context,name) {
    return Row(
      children: [
        Align(alignment: Alignment.bottomRight, child: Text((index+1).toString()+".")),
        Expanded(
          child: ListTile(
            leading: Container(color:selectColor(name),height: 50,width: 60,),
            title: Text(name),
            subtitle: Text(scoreList[index]+" PTS"),
          ),
        ),
      ],
    );
  }

  selectColor(color){
    switch(color){
      case "BLACK" : return Colors.black;
      case "RED" : return Colors.red;
      case "YELLOW" : return Colors.yellow;
      case "BLUE" : return Colors.blue;
      case "GREEN" : return Colors.green;
      case "ORANGE" : return Colors.orange;
      case "PINK" : return Colors.pink;
      case "PURPLE" : return Colors.purple;
      case "TEAL" : return Colors.teal;
    }
  }

}
