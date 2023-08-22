import 'package:flutter/material.dart';
import 'package:zenmoney_clone/resources/my_colors.dart';
import 'package:zenmoney_clone/resources/my_images.dart';
import 'package:zenmoney_clone/ui/screens/authorization/authorization_notifier.dart';
import 'package:zenmoney_clone/utilities/provider.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      model: AuthoriationNotifier(),
      child: const _ScreenContent(),
    );
  }
}

class _ScreenContent extends StatelessWidget {
  const _ScreenContent();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LogoWidget(),
              _GoogleButtonWidget(),
              _CreateAccountButtonWidget(),
              _LoginAccountButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: SizedBox(
        width: 168,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(MyImages.logo),
        ),
      ),
    );
  }
}

class _GoogleButtonWidget extends StatelessWidget {
  const _GoogleButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: () async => await Provider.read<AuthoriationNotifier>(context)
            ?.signInWithGoogle(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: MyColors.indigo,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: MyColors.background,
                ),
                width: 28,
                padding: const EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(MyImages.googleLogo),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Sign in with Google",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: MyColors.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateAccountButtonWidget extends StatelessWidget {
  const _CreateAccountButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 8,
        ),
        child: GestureDetector(
          onTap: () async => await Provider.read<AuthoriationNotifier>(context)
              ?.navigateToSignUp(context),
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
              "Create an account",
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

class _LoginAccountButtonWidget extends StatelessWidget {
  const _LoginAccountButtonWidget();

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
            "Already have an account?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MyColors.indigo,
            ),
          ),
          GestureDetector(
            onTap: () async =>
                await Provider.read<AuthoriationNotifier>(context)
                    ?.navigateToSignIn(context),
            child: Text(
              "Sign in",
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
