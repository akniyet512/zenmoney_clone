import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/ui/screens/sign_up/sign_up_notifier.dart';
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
            _FormSectionWidget(),
            _SignUpButtonWidget(),
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
    final SignUpNotifier? model =
        NotifierProvider.watch<SignUpNotifier>(context);
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
              "Account set-up",
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
        Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "I agree to the ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: MyColors.foreground,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "privacy policy",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: MyColors.indigo,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                      Text(
                        " and ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: MyColors.foreground,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Text(
                          "user agreement",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: MyColors.indigo,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
          onTap: () async => await model?.signUpWithEmailAndPassword(context),
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
              "Sign up",
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
