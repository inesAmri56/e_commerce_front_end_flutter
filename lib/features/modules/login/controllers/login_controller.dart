import 'package:ecommerce/features/modules/login/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../../../../core/outils/app_storage.dart';
import '../../../../core/outils/app_url.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  final _storage = StorageService();

  Future<void> login() async {
    try {
      isLoading.value = true;

      final response = await Dio().post(
        AppUrl.login,
        data: {
          'username': userNameController.text.trim(),
          'password': passwordController.text.trim(),
        },
      );
      print("******44445554"
          "*********55554787852444444");
      if (response.statusCode == 200) {
        print("***************");
        final user =UserModel.fromJson(response.data);

        // ✅ Sauvegarder le token
        await _storage.saveToken(user.accessToken);
        print('✅ Token sauvegardé : ${user.accessToken}');

        // ✅ Sauvegarder les infos utilisateur si nécessaire
        await _storage.saveUser({
          'id': user.id,
          'username': user.username,
          'email': user.email,
          'roles': user.roles,
        });

        // ✅ Aller à la page Home
        Get.offAllNamed(Routes.HOME);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 400) {
          Get.snackbar('Erreur', 'Nom d\'utilisateur ou mot de passe invalide');
        } else {
          Get.snackbar('Erreur', 'Erreur serveur : ${e.response?.statusCode}');
        }
      } else {
        Get.snackbar('Erreur', 'Erreur réseau : ${e.message}');
      }
    } catch (e) {
      Get.snackbar('Erreur', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
