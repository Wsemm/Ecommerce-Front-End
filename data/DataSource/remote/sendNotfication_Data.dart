import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class SendNotficationData {
  Crud crud;

  SendNotficationData(this.crud);

  sendNotfication(String to, title, body) async {
    var response = await crud.postData(AppLink.notfication, {
      "to": to,
      "title": title,
      "body": body,
    });

    return response.fold((l) => l, (r) => r);
  }
}
