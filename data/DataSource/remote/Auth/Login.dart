import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postData(
    String email,
    String password,
    String token,
  ) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
      "token": token,
    });

    return response.fold((l) => l, (r) => r);
  }

  postDataDelivery(String email, String password, String token) async {
    var response = await crud.postData(AppLink.loginDelivery, {
      "email": email,
      "password": password,
      "token": token,
    });

    return response.fold((l) => l, (r) => r);
  }

  postDataAdmin(String email, String password, String token) async {
    var response = await crud.postData(AppLink.loginAdmin, {
      "email": email,
      "password": password,
      "token": token,
    });
    return response.fold((l) => l, (r) => r);
  }
}
