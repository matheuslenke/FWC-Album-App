import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/app_colors.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

import 'presenter/login_presenter.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  void onPressedLogin() {
    final valid = formKey.currentState?.validate() ?? false;
    if (valid) {
      showLoader();
      widget.presenter.login(
        emailEC.text,
        passwordEC.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_login.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        (MediaQuery.of(context).size.width > 350 ? .30 : .25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: Text(
                        "Login",
                        style: context.textStyles.titleWhite,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.email("E-mail inválido")
                    ]),
                    decoration: const InputDecoration(
                        label: Text("E-mail"),
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.min(
                          6, 'Sua senha deve conter pelo menos 6 caracteres'),
                    ]),
                    controller: passwordEC,
                    obscureText: true,
                    decoration: const InputDecoration(
                        label: Text("Senha"),
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      "Esqueceu a senha?",
                      style:
                          context.textStyles.textSecondaryFontMedium.copyWith(
                        color: context.colors.yellow,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Button(
                    width: MediaQuery.of(context).size.width * 0.9,
                    onPressed: onPressedLogin,
                    style: context.buttonStyles.yellowButton,
                    labelStyle: context
                        .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                    label: 'Entrar',
                  )
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text.rich(
                      style: context.textStyles.textSecondaryFontMedium
                          .copyWith(color: Colors.white),
                      TextSpan(text: 'Não possui uma conta? ', children: [
                        TextSpan(
                            text: "Cadastre-se",
                            style: context.textStyles.textSecondaryFontMedium
                                .copyWith(color: context.colors.yellow),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed("/auth/register"))
                      ]),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
