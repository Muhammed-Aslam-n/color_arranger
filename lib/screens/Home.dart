import 'package:color_arranger/controller/getx_controller.dart';
import 'package:color_arranger/screens/color_chart.dart';
import 'package:color_arranger/widget/common_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final colorChangerController = ColorChangerController.colorChangerController;
  double scrollSpeedVariable = 5;
  @override
  void initState() {
    colorChangerController.setPalletListValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Home'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 300.h,
                width: MediaQuery.of(context).size.width,
                child: GetBuilder<ColorChangerController>(

                  builder: (colorChangerController) {
                    return ReorderableGridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 0.8,
                      children: colorChangerController.palletList!.map((palletElements) {
                        if (palletElements['name'].length > 1) {
                          return buildImageItem(
                              url: palletElements['name'][0],
                              isMultiple: true,
                              index: colorChangerController.palletList!.indexOf(palletElements));
                        }
                        return buildImageItem(url: palletElements['name'][0]);
                      }).toList(),
                      scrollSpeedController: (int timeInMilliSecond,
                          double overSize, double itemSize) {
                        if (timeInMilliSecond > 1500) {
                          scrollSpeedVariable = 15;
                        } else {
                          scrollSpeedVariable = 5;
                        }
                        return scrollSpeedVariable;
                      },
                      onReorder: (oldIndex, newIndex) {
                        ColorChangerController.colorChangerController.updatePalletSet(oldIndex: oldIndex, newIndex: newIndex);
                      },
                      dragWidgetBuilder: (index, child) {
                        return const Card(
                          color: Colors.blue,
                          child: Text("Selected"),
                        );
                      },
                    );
                  }
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CommonButton(
              text: "SUBMIT",
              textColor: Colors.black,
              bgColor: Colors.green,
              onPressed: () {
                Get.to(() => Chart());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageItem(
      {required String? url, bool isMultiple = false, index}) {
    if (isMultiple) {
      return Card(
        key: ValueKey(url),
        child: GestureDetector(
          onTap: () {
            showPalletVariants(colorChangerController.palletList![index]);
          },
          child: Stack(
            children: [
              Image.asset(
                url!,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: Image.asset(
                    "assets/images/grid_images/icon_grid_overlay/icon_pictures.png"),
                right: 5,
                top: 3,
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        key: ValueKey(url),
        child: Image.asset(
          url!,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  showPalletVariants(pallet) {
    return showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Entypo.cancel_circled),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  SizedBox(
                    height: 180.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) => SizedBox(
                          width: 250,
                          child: Image.asset(
                            pallet['name'][index],
                            fit: BoxFit.cover,
                            width: 250,
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        itemCount: pallet['name'].length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
