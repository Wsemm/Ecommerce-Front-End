import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUP, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resendverifyCode, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
