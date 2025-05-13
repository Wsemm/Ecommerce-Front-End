import 'package:ecommerce_project/core/constant/color.dart';

import '../../../controller/HomeScreen_Controller.dart';
import 'Custom_ButtonAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        color: AppColor.primaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i =
                  index > controller.listPage.length - 2 ? index - 1 : index;

              return index == 2
                  ? Spacer()
                  : CustomButtonAppBar(
                      onPressed: () {
                        controller.changePage(i);
                      },
                      // TextButton: controller.bottomappBar[i]['title'],
                      iconData: controller.bottomappBar[i]['icon'],
                      active: controller.currentPage == i ? true : false,
                    );
            })
          ],
        ),
      ),
    );
  }
}
