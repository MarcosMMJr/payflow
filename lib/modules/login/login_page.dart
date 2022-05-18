import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.bottomCenter,
                    radius: 0.6,
                    colors: [
                      AppColors.background,
                      AppColors.primary,
                    ]),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(
                      Rect.fromLTRB(0, 233, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  AppImages.person,
                  height: 373,
                  width: 208,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: AnimatedCard(
                      direction: AnimatedCardDirection.bottom,
                      child: Text(
                        "Organize seus boletos em um só lugar",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.titleHome,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 40, right: 40),
                    child: SocialLoginButton(
                      onTap: () async {
                        controller.googleSignIn(context);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
