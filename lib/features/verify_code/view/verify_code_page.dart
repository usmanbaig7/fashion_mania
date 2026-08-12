import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../custom_widgets/circle_back_button.dart';
import '../../../custom_widgets/otp_box.dart';
import '../../../custom_widgets/primary_button.dart';
import '../bloc/verify_code_cubit.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key, required this.email});

  final String email;

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  late final List<TextEditingController> controllers = List.generate(
    VerifyCodeCubit.codeLength,
    (_) => TextEditingController(),
  );
  late final List<FocusNode> focusNodes = List.generate(
    VerifyCodeCubit.codeLength,
    (_) => FocusNode(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyCodeCubit(),
      child: Builder(
        builder: (context) => Scaffold(
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
                  const SizedBox(height: 28),
                  const Text(
                    'Verify Code',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please enter the code we just sent to email',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.email,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(VerifyCodeCubit.codeLength, (
                      index,
                    ) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index == VerifyCodeCubit.codeLength - 1
                              ? 0
                              : 14,
                        ),
                        child: OtpBox(
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          onChanged: (value) {
                            context.read<VerifyCodeCubit>().digitChanged(
                              index,
                              value,
                            );
                            if (value.isNotEmpty &&
                                index < VerifyCodeCubit.codeLength - 1) {
                              focusNodes[index + 1].requestFocus();
                            } else if (value.isEmpty && index > 0) {
                              focusNodes[index - 1].requestFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Didn’t receive OTP?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 6),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        for (final controller in controllers) {
                          controller.clear();
                        }
                        context.read<VerifyCodeCubit>().reset();
                        focusNodes.first.requestFocus();
                      },
                      child: const Text(
                        'Resend code',
                        style: AppTextStyles.link,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    label: 'Verify',
                    // Verified — drop the auth stack and land on the dashboard.
                    onPressed: () => context.go(AppRoutes.dashboard),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
