import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../custom_widgets/image_placeholder.dart';
import '../../../custom_widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 380,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Expanded(
                          flex: 47,
                          child: ImagePlaceholder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(110),
                            ),
                            iconSize: 44,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          flex: 43,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: ImagePlaceholder(isCircle: true)),
                              SizedBox(height: 14),
                              Expanded(child: ImagePlaceholder(isCircle: true)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
                      left: -6,
                      bottom: 30,
                      child: Text(
                        '*',
                        style: TextStyle(
                          fontSize: 64,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: AppTextStyles.onboardingTitle,
                  children: [
                    TextSpan(text: 'The '),
                    TextSpan(
                      text: 'Fashion App',
                      style: TextStyle(color: AppColors.primary),
                    ),
                    TextSpan(text: ' That\nMakes You Look Your Best'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur '
                'adipiscing elit, sed do eiusmod tempor incididunt',
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitle,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: 'Let’s Get Started',
                onPressed: () => context.push(AppRoutes.signIn),
              ),
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: AppTextStyles.body,
                  ),
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.signIn),
                    child: const Text('Sign In', style: AppTextStyles.link),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
