import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/ui/screens/forgot_password/forgot_password_notifier.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NotifierProvider(
      model: ForgotPasswordNotifier(),
      child: const _ScreenContent(),
    );
  }
}

class _ScreenContent extends StatelessWidget {
  const _ScreenContent();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          _GoBackWidget(),
          _TitleWidget(),
          _SubtitleWidget(),
          _EmailTextFieldWidget(),
          _SendButtonWidget(),
        ],
      ),
    );
  }
}

class _GoBackWidget extends StatelessWidget {
  const _GoBackWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => NotifierProvider.read<ForgotPasswordNotifier>(context)
              ?.navigateBack(context),
          child: const Icon(Icons.close),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Text(
        "Regain access",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w300,
          color: MyColors.foreground,
        ),
      ),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Text(
        "Enter email you used to register. We will send the new password to the email.",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: MyColors.foreground,
        ),
      ),
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordNotifier? model =
        NotifierProvider.watch<ForgotPasswordNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: TextField(
          controller: model?.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: MyColors.indigo),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.indigo),
            ),
            suffixIcon: Icon(
              Icons.email,
              color: MyColors.indigo,
            ),
          ),
        ),
      ),
    );
  }
}

class _SendButtonWidget extends StatelessWidget {
  const _SendButtonWidget();

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordNotifier? model =
        NotifierProvider.watch<ForgotPasswordNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 8,
        ),
        child: GestureDetector(
          onTap: () async => await model?.resetPassword(context),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(),
              color: MyColors.background,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: Text(
              "Send",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.foreground,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
