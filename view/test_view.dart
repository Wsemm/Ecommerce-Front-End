import '../controller/test_Controller.dart';
import '../core/class/handlingDataView.dart';
import '../core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    double currentPrice = 100.00; // Example current price
    double discountedPrice = 70.00; // Example discounted price
    Get.put(TestController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Price Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Price: \$${currentPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Discounted Price: ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '\$${discountedPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
            // Additional form components can be added here if needed.
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: AppColor.primaryColor,
    //     title: const Text("Test"),
    //   ),
    //   body: GetBuilder<TestController>(builder: (controller) {
    //     return handlingDataView(
    //         statusRequest: controller.statusRequest,
    //         widget: ListView.builder(
    //             itemCount: controller.data.length,
    //             itemBuilder: (context, index) {
    //               return Text("${controller.data}");
    //             }));
    //   }),
    // );
  }
}
