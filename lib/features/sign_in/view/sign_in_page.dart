import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../custom_widgets/app_text_field.dart';
import '../../../custom_widgets/primary_button.dart';
import '../../../custom_widgets/social_button.dart';
import '../bloc/sign_in_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Hi! Welcome back, you’ve been missed',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitle,
                ),
                const SizedBox(height: 40),
                const Text('Email', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                AppTextField(
                  hint: 'example@gmail.com',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const Text('Password', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                BlocBuilder<SignInCubit, SignInState>(
                  builder: (context, state) {
                    return AppTextField(
                      hint: '••••••••••••',
                      controller: passwordController,
                      obscureText: state.obscurePassword,
                      suffixIcon: IconButton(
                        onPressed: context
                            .read<SignInCubit>()
                            .togglePasswordVisibility,
                        icon: Icon(
                          state.obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => context.push(
                      AppRoutes.verifyCode,
                      extra: emailController.text,
                    ),
                    child: const Text(
                      'Forgot Password?',
                      style: AppTextStyles.linkPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                PrimaryButton(
                  label: 'Sign In',
                  onPressed: () => context.push(
                    AppRoutes.verifyCode,
                    extra: emailController.text,
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: AppColors.divider, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Or sign in with',
                        style: AppTextStyles.subtitle.copyWith(fontSize: 13),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: AppColors.divider, thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      onTap: () {},
                      child: const Icon(
                        Icons.apple,
                        size: 28,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 20),
                    SocialButton(
                      onTap: () {},
                      child: const Text(
                        'G',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4285F4),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SocialButton(
                      onTap: () {},
                      child: const Text(
                        'f',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1877F2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account? ',
                      style: AppTextStyles.body,
                    ),
                    GestureDetector(
                      onTap: () => context.push(AppRoutes.completeProfile),
                      child: const Text('Sign Up', style: AppTextStyles.link),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
