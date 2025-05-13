import '../../../core/constant/ImageAssets.dart';
import '../../model/onboarding_model.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoadingList = [
  OnBoardingModel(
      title: "Choose Product".tr,
      body: "we have 100k product ,Choose Your Product From Our E-commerce Shop"
          .tr,
      image: AppImageAsset.onBoadingImageOne),
  OnBoardingModel(
      title: "Easy and safe payment".tr,
      body: "we Encryption all the payment data to keep it safe".tr,
      image: AppImageAsset.onBoadingImageTwo),
  OnBoardingModel(
      title: "Track Your Order".tr,
      body: "Track Your Order from the application easily".tr,
      image: AppImageAsset.onBoadingImageThree),
  // OnBoardingModel(
  //     title: "Fast Deleviry",
  //     body:
  //         "we have 100k product ,Choose \n Your Product From Our \n E-commerce Shop",
  //     image: AppImageAsset.onBoadingImageFour),
];
