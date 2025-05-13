import '../../../core/constant/ImageAssets.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/orders/Order_Controller.dart';
import '../../../data/DataSource/remote/orders/Rateing_Data.dart';

RateOrderData rateOrderData = RateOrderData(Get.find());
MyOrder_Controller myOrderController = Get.put(MyOrder_Controller());

// show the dialog
showDialogRaiting(BuildContext context, String id) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Please rate the service so we can get better. ',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(
        AppImageAsset.logo,
        height: 150,
        width: 150,
      ),
      starSize: 38,
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      starColor: AppColor.primaryColor,
      submitButtonTextStyle: TextStyle(color: AppColor.primaryColor),
      onSubmitted: (response) async {
        await myOrderController.rateMyOrder(
            id, response.rating.toString(), response.comment);
        // rateOrderData.rateOrder(
        //     id, response.rating.toString(), response.comment);

        // rateingController.rateOrder();
        print('rating: ${response.rating}, comment: ${response.comment}');

        // // TODO: add your own logic
        // if (response.rating < 3.0) {
        //   // send their comments to your email or anywhere you wish
        //   // ask the user to contact you instead of leaving a bad review
        // } else {
        //   // _rateAndReviewApp();
        // }
      },
    ),
  );
}
