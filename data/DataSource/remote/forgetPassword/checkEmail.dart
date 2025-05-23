import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(
    String email,
  ) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
