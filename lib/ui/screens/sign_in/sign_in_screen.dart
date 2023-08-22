import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/ui/screens/sign_in/sign_in_notifier.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NotifierProvider(
      model: SignInNotifier(),
      child: const _ScreenContent(),
    );
  }
}

class _ScreenContent extends StatelessWidget {
  const _ScreenContent();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _FormSectionWidget(),
            _SignInButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _FormSectionWidget extends StatelessWidget {
  const _FormSectionWidget();

  @override
  Widget build(BuildContext context) {
    final SignInNotifier? model =
        NotifierProvider.watch<SignInNotifier>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => model?.navigateBack(context),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              "Sign in",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w300,
                color: MyColors.foreground,
              ),
            ),
          ),
        ),
        Container(
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
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: TextField(
              controller: model?.passwordController,
              keyboardType: TextInputType.emailAddress,
              obscureText: model?.isObscure ?? true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: MyColors.indigo),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColors.indigo),
                ),
                suffixIcon: GestureDetector(
                  onTap: () => model?.setObscure(!model.isObscure),
                  child: Icon(
                    model?.isObscure ?? true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: MyColors.indigo,
                  ),
                ),
              ),
            ),
          ),
        ),
        const _ForgetPasswordWidget(),
      ],
    );
  }
}
class _ForgetPasswordWidget extends StatelessWidget {
  const _ForgetPasswordWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Forget password?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MyColors.indigo,
            ),
          ),
          GestureDetector(
            onTap: () async =>
                await NotifierProvider.read<SignInNotifier>(context)
                    ?.navigateToForgotPassword(context),
            child: Text(
              "Reset",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MyColors.indigo,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignInButtonWidget extends StatelessWidget {
  const _SignInButtonWidget();

  @override
  Widget build(BuildContext context) {
    final SignInNotifier? model =
        NotifierProvider.watch<SignInNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 8,
        ),
        child: GestureDetector(
          onTap: () async => await model?.signInWithEmailAndPassword(context),
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
              "Sign in",
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
