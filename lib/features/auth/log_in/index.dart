import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/routes/routes.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/features/auth/log_in/controller.dart';

import 'package:shop/features/auth/widgets/base_auth_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return BaseAuthPage(
      title: tr(LocaleKeys.log_in_to_your_account),
      subtitle: tr(LocaleKeys.log_in_to_get_started),
      gradientColors: const [
        StyleRepo.darkedOrang,
        StyleRepo.orange,
        StyleRepo.lightOrange,
      ],
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.username,
              decoration: InputDecoration(
                labelText: tr(LocaleKeys.user_name),
                labelStyle: TextStyle(color: StyleRepo.orange),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return tr(LocaleKeys.this_field_is_required);
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  labelText: tr(LocaleKeys.password),
                  labelStyle: TextStyle(color: StyleRepo.orange),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    color: StyleRepo.orange,
                    onPressed: controller.togglePasswordVisibility,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return tr(LocaleKeys.this_field_is_required);
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 24),

            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed:
                      controller.isLoading.value ? null : controller.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: StyleRepo.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:
                      controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                            tr(LocaleKeys.login),
                            style: TextStyle(color: StyleRepo.white),
                          ),
                ),
              ),
            ),
            
            const SizedBox(height: 40),

            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.sizeOf(context).width * 0.7,
              height: 2,
              decoration: BoxDecoration(color: StyleRepo.orange),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tr(LocaleKeys.Dont_have_an_account)),
                TextButton(
                  onPressed: () => Get.toNamed(Pages.register.value),
                  child: Text(
                    tr(LocaleKeys.register),
                    style: TextStyle(
                      color: StyleRepo.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
