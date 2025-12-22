import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/features/auth/register/controller.dart';
import 'package:shop/features/auth/widgets/base_auth_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return BaseAuthPage(
      title: tr(LocaleKeys.create_your_account),
      subtitle: tr(LocaleKeys.register_to_get_started),
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

            TextFormField(
              controller: controller.firstName,
              decoration: InputDecoration(
                labelText: tr(LocaleKeys.first_name),
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

            TextFormField(
              controller: controller.lastName,
              decoration: InputDecoration(
                labelText: tr(LocaleKeys.last_name),
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

            TextFormField(
              controller: controller.number,
              decoration: InputDecoration(
                labelText: tr(LocaleKeys.number),
                labelStyle: TextStyle(color: StyleRepo.orange),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return tr(LocaleKeys.this_field_is_required);
                }
                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return tr(LocaleKeys.only_numbers_allowed);
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                labelText: "user@gmail.com",
                labelStyle: TextStyle(color: StyleRepo.orange),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return tr(LocaleKeys.this_field_is_required);
                }
                if (!RegExp(r'^[\w.+-]+@gmail\.com$').hasMatch(value)) {
                  return tr(LocaleKeys.enter_a_valid_email);
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
            const SizedBox(height: 30),

            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed:
                      controller.isLoading.value ? null : controller.register,
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
                            tr(LocaleKeys.register),
                            style: TextStyle(color: StyleRepo.white),
                          ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
