import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial/pages/home.dart';

class LoginScreenController extends GetxController {
  late TextEditingController user;
  late TextEditingController password;
  @override
  void onInit() {
    super.onInit();
    user = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    user.dispose();
    password.dispose();
  }

  Future login(BuildContext context) async {
    Response resp = await GetConnect().post(
      "http://localhost:8081/users/login",
      {
        "id": user.value.text,
        "pwd": password.value.text,
        "token": "SOSD",
      },
      contentType: "application/json",
    );
    print(resp.body);
    Get.to(ImagePicke());
  }
}
