import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../custom_widgets/app_text_field.dart';
import '../../../custom_widgets/circle_back_button.dart';
import '../../../custom_widgets/primary_button.dart';
import '../bloc/complete_profile_cubit.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompleteProfileCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleBackButton(onTap: () => context.pop()),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Complete Your Profile',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Don’t worry, only you can see your personal data. '
                  'No one else will be able to see it.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitle,
                ),
                const SizedBox(height: 28),
                // Avatar placeholder with the brown edit badge.
                Center(
                  child: SizedBox(
                    width: 110,
                    height: 110,
                    child: Stack(
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: const BoxDecoration(
                            color: AppColors.placeholder,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 62,
                            color: AppColors.placeholderIcon,
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 6,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Text('Name', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                AppTextField(hint: 'John Doe', controller: nameController),
                const SizedBox(height: 20),
                const Text('Phone Number', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
                        builder: (context, state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: state.countryCode,
                              isDense: true,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: AppColors.textPrimary,
                              ),
                              style: AppTextStyles.fieldInput,
                              items: CompleteProfileCubit.countryCodes
                                  .map(
                                    (code) => DropdownMenuItem<String>(
                                      value: code,
                                      child: Text(code),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (code) {
                                if (code != null) {
                                  context
                                      .read<CompleteProfileCubit>()
                                      .countryCodeChanged(code);
                                }
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 1,
                        height: 22,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        color: AppColors.border,
                      ),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: AppTextStyles.fieldInput,
                          cursorColor: AppColors.primary,
                          decoration: const InputDecoration(
                            hintText: 'Enter Phone Number',
                            hintStyle: AppTextStyles.fieldHint,
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Gender', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.border),
                  ),
                  child:
                      BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
                        builder: (context, state) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: state.gender,
                              isExpanded: true,
                              hint: const Text(
                                'Select',
                                style: AppTextStyles.fieldHint,
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 22,
                                color: AppColors.textPrimary,
                              ),
                              style: AppTextStyles.fieldInput,
                              items: CompleteProfileCubit.genders
                                  .map(
                                    (gender) => DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(gender),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (gender) {
                                if (gender != null) {
                                  context
                                      .read<CompleteProfileCubit>()
                                      .genderChanged(gender);
                                }
                              },
                            ),
                          );
                        },
                      ),
                ),
                const SizedBox(height: 36),
                PrimaryButton(
                  label: 'Complete Profile',
                  onPressed: () => context.go(AppRoutes.dashboard),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
