import '../data/DataSource/remote/sendNotfication_Data.dart';
import 'package:get/get.dart';

class SendNotfication_Controller extends GetxController {
  SendNotficationData sendNotficationData =
      Get.put(SendNotficationData(Get.find()));

  sendNotfication(String to, title, body) {
    sendNotficationData.sendNotfication(to, title, body);
  }
}
