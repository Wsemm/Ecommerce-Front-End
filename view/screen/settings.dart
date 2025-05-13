import '../../controller/Settings_Controller.dart';
import '../../core/constant/ImageAssets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/color.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 2,
              color: AppColor.primaryColor,
            ),
            Positioned(
              top: Get.width / 2.4,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(AppImageAsset.avatar),
                  backgroundColor: Colors.white,
                  radius: 40,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height / 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: Text("Disable notfication"),
                  trailing: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColor.primaryColor,
                  ),
                ),
                ListTile(
                  onTap: () {
                    controller.gotoAddress();
                  },
                  title: Text("adress"),
                  trailing: Icon(Icons.location_on),
                ),
                ListTile(
                  onTap: () {
                    controller.testData.getData2();
                  },
                  title: Text("About us"),
                  trailing: Icon(Icons.info_outline),
                ),
                // Divider(),
                ListTile(
                  onTap: () {
                    launchUrl(Uri.parse("tel:+963 0936393564"));
                  },
                  title: Text("Contact us"),
                  trailing: Icon(Icons.phone),
                ),
                // Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.logout),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
