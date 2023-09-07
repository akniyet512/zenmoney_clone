import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/local_keys.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/ui/screens/sign_up/sign_up_notifier.dart';
import 'package:zenmoney_clone/utilities/multilanguages.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NotifierProvider(
      model: SignUpNotifier(),
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
            _GoBackWidget(),
            _TitleWidget(),
            _EmailTextFieldWidget(),
            _PasswordTextFieldWidget(),
            _AgreementWidget(),
            _SignUpButtonWidget(),
          ],
        ),
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
          onTap: () => NotifierProvider.read<SignUpNotifier>(context)
              ?.navigateBack(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Text(
          MultiLanguages.of(context)!.translate(LocalKeys.accountSetup),
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w300,
            color: MyColors.foreground,
          ),
        ),
      ),
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    final SignUpNotifier? model =
        NotifierProvider.watch<SignUpNotifier>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: model?.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: MultiLanguages.of(context)!.translate(LocalKeys.email),
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
    );
  }
}

class _PasswordTextFieldWidget extends StatelessWidget {
  const _PasswordTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    final SignUpNotifier? model =
        NotifierProvider.watch<SignUpNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: TextField(
          controller: model?.passwordController,
          keyboardType: TextInputType.emailAddress,
          obscureText: model?.isObscure ?? true,
          decoration: InputDecoration(
            labelText:
                MultiLanguages.of(context)!.translate(LocalKeys.password),
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
    );
  }
}

class _AgreementWidget extends StatelessWidget {
  const _AgreementWidget();

  @override
  Widget build(BuildContext context) {
    final SignUpNotifier? model =
        NotifierProvider.watch<SignUpNotifier>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Checkbox(
            shape: const CircleBorder(),
            value: model?.isAgreementSelected,
            activeColor: MyColors.indigo,
            onChanged: (value) => model!.setAgreementSelected(value!),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: MultiLanguages.of(context)!
                        .translate(LocalKeys.privacyText1),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: MyColors.foreground,
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () async =>
                          await model?.launchPrivacyPolicyUrl(context),
                      child: Text(
                        MultiLanguages.of(context)!
                            .translate(LocalKeys.privacyText2),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: MyColors.indigo,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: MultiLanguages.of(context)!
                        .translate(LocalKeys.privacyText3),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: MyColors.foreground,
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () async =>
                          await model?.launchUserAgreementUrl(context),
                      child: Text(
                        MultiLanguages.of(context)!
                            .translate(LocalKeys.privacyText4),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: MyColors.indigo,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpButtonWidget extends StatelessWidget {
  const _SignUpButtonWidget();

  @override
  Widget build(BuildContext context) {
    final SignUpNotifier? model =
        NotifierProvider.watch<SignUpNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 8,
        ),
        child: GestureDetector(
          onTap: model?.canStartAuth == true
              ? () async => await model?.signUpWithEmailAndPassword(context)
              : null,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(),
              color: MyColors.background,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: model?.isAuthProgress == true
                ? SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: MyColors.foreground,
                    ),
                  )
                : Text(
                    MultiLanguages.of(context)!.translate(LocalKeys.signUp),
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
