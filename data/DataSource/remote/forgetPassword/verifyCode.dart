import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  postData(
    String email,
    String verifycode,
  ) async {
    var response = await crud.postData(AppLink.verifyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
