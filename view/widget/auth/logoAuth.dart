import '../../../core/constant/ImageAssets.dart';
import 'package:flutter/material.dart';

class logoAuth extends StatelessWidget {
  const logoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return Image.asset(
      AppImageAsset.logo,
      height: Screen_Height * 0.22,
    );
  }
}
