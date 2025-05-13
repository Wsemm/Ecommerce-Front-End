import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class SendNotficationData extends Api {
  Crud crud;

  SendNotficationData(this.crud);

  sendNotfication(String to, title, body) async {
    try {
      final response = await api.post(EndPoint.notfication, data: {
        "to": to,
        "title": title,
        "body": body,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }
}
