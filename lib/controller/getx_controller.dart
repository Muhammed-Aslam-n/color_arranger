import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ColorChangerController extends GetxController{
  static ColorChangerController colorChangerController = Get.find();

  final blackSet = [
    "assets/images/grid_images/set_black/black1.png",
  ];
  final blueSet = [
    "assets/images/grid_images/set_blue/blue1.png",
    "assets/images/grid_images/set_blue/blue2.png",
    "assets/images/grid_images/set_blue/blue3.png",
  ];
  final greenSet = [
    "assets/images/grid_images/set_green/green1.png",
    "assets/images/grid_images/set_green/green2.png",
    "assets/images/grid_images/set_green/green3.png",
  ];
  final orangeSet = [
    "assets/images/grid_images/set_orange/orange1.png",
    "assets/images/grid_images/set_orange/orange2.png",
    "assets/images/grid_images/set_orange/orange3.png",
  ];

  final pinkSet = [
    "assets/images/grid_images/set_pink/pink1.png",
    "assets/images/grid_images/set_pink/pink2.png",
    "assets/images/grid_images/set_pink/pink3.png",
  ];
  final purpleSet = [
    "assets/images/grid_images/set_purple/purple1.png",
    "assets/images/grid_images/set_purple/purple2.png",
    "assets/images/grid_images/set_purple/purple3.png",
  ];
  final redSet = [
    "assets/images/grid_images/set_red/red1.png",
    "assets/images/grid_images/set_red/red2.png",
    "assets/images/grid_images/set_red/red3.png",
  ];
  final tealSet = [
    "assets/images/grid_images/set_teal/teal1.png",
    "assets/images/grid_images/set_teal/teal2.png",
    "assets/images/grid_images/set_teal/teal2.png",
  ];
  final yellowSet = [
    "assets/images/grid_images/set_yellow/yellow1.png",
  ];
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


  List<Map<String,dynamic>>? palletList;
  setPalletListValues(){
    palletList = [
      {"name": blackSet, "color": "BLACK"},
      {"name": blueSet, "color": "BLUE"},
      {"name": greenSet, "color": "GREEN"},
      {"name": orangeSet, "color": "ORANGE"},
      {"name": pinkSet, "color": "PINK"},
      {"name": purpleSet, "color": "PURPLE"},
      {"name": redSet, "color": "RED"},
      {"name": tealSet, "color": "TEAL"},
      {"name": yellowSet, "color": "YELLOW"},
    ];
    update();
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

  updatePalletSet({required oldIndex, required newIndex}){
    final element =
    palletList!.removeAt(oldIndex);
    palletList!
        .insert(newIndex, element);
    update();
  }

  resetPalletList(){
    palletList!.clear();
    setPalletListValues();
    update();
  }



}
