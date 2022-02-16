import 'package:color_arranger/widget/common_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/getx_controller.dart';

class Chart extends StatelessWidget {

  final colorChangerController = ColorChangerController.colorChangerController;

  Chart({ Key? key}) : super(key: key);

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
                      return buildColorPallet(index, colorChangerController.palletList![index]['name'][0],context,colorChangerController.palletList![index]['color']);
                    },
                    itemCount: colorChangerController.palletList!.length,
                  ),
                ),
                SizedBox(height: 20.h,),
                CommonButton(
                  text: "START",
                  bgColor: Colors.green,
                  onPressed: () {
                    Get.back();
                    colorChangerController.resetPalletList();
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
        visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
            leading: Container(color:colorChangerController.selectColor(name),height: 50,width: 60,),
            title: Text(name,style: const TextStyle(fontSize: 15),),
            subtitle: Text(colorChangerController.scoreList[index]+" PTS",style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w600),),
          ),
        ),
      ],
    );
  }



}
