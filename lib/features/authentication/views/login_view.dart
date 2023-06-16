import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/squircle.helper.dart';
import '../logic/login_view_controller.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 38.hsbt0,
              child: Stack(
                children: [
                  const TopClipperWidget(),
                  Positioned(
                    top: 10.hsbt0,
                    left: 15.wsbt0,
                    child: Text(
                      AppLocalizations.of(context)!.welcome,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.toLoginMessage,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: AppColors.lightBlack,
                              ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.enterPhoneNumber,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: AppColors.lightBlack,
                              ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        key: const Key('phone'),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.grey),
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.phone,
                          suffix: const Text("967+"),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        // validator: MultiValidator([
                        //   Validator.of(context)!.minLength(
                        //       AttributeLocalizations.of(context)!.phone, 9),
                        //   Validator.of(context)!.pattern(
                        //     AttributeLocalizations.of(context)!.phone,
                        //     yemeniPhoneRegex,
                        //   ),
                        // ]),
                        onSaved: (phone) {}),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        key: const Key('password'),
                        controller: passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.grey),
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.password),
                        // validator: MultiValidator([
                        //   Validator.of(context)!.required(
                        //     AttributeLocalizations.of(context)!.password,
                        //   ),
                        //   Validator.of(context)!.minLength(
                        //       AttributeLocalizations.of(context)!.password, 8),
                        // ]),
                        onSaved: (password) {}),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 5.hs,
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 4),
                          child: Text(
                            AppLocalizations.of(context)!.forgetPassword,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: AppColors.secondarySwatch[400]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          navigateToOtpVerificationView(context: context);
                        }
                      },
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          // child: state is LoginRequestLoading
                          //     ? const SizedBox(
                          //         height: 20,
                          //         width: 20,
                          //         child: CircularProgressIndicator(
                          //           valueColor: AlwaysStoppedAnimation<Color>(
                          //               Colors.white),
                          //           strokeWidth: 3,
                          //         ),
                          //       )
                          //     :
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        navigateToSignUpView(context:context);
                      },
                      child: SizedBox(
                        height: 47,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.signUp,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.grey),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 9.hsbt0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 1.1,
                                  decoration: const BoxDecoration(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
                                  padding:
                                  const EdgeInsets.only(bottom: 6),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppLocalizations.of(context)!.or,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: AppColors.grey,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 1.1,
                                  decoration: const BoxDecoration(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 27.msbt0,
                              width: 27.msbt0,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: squircle(radius: 0.035),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0.0, 4.0),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                onTap: () {},
                                child: Icon(
                                  Iconsax.heart,
                                  color: AppColors.primaryColor,
                                  size: 9.msbt0,
                                ),
                              ),
                            ),
                            Container(
                              height: 27.msbt0,
                              width: 27.msbt0,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: squircle(radius: 0.035),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0.0, 4.0),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                onTap: () {},
                                child: Icon(
                                  Iconsax.heart,
                                  color: AppColors.primaryColor,
                                  size: 9.msbt0,
                                ),
                              ),
                            ),
                            Container(
                              height: 27.msbt0,
                              width: 27.msbt0,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: squircle(radius: 0.035),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0.0, 4.0),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                onTap: () {},
                                child: Icon(
                                  Iconsax.heart,
                                  color: AppColors.primaryColor,
                                  size: 9.msbt0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class TopClipperWidget extends StatelessWidget {
  const TopClipperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primarySwatch[300],
        ),
        const QuarterCircle(),
      ],
    );
  }
}

class QuarterCircle extends StatelessWidget {
  final Color color;

  const QuarterCircle({
    super.key,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: ClipRect(
        child: CustomPaint(
          painter: QuarterCirclePainter(),
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  const QuarterCirclePainter();

  final Color fillColor = AppColors.primaryColor;
  final double littleGap = 5;

  @override
  void paint(Canvas canvas, Size size) {
    final double curveHeight = 37.hsbt0;
    final double curveWidth = 100.wsbt0;

    final paint = Paint()
      // parametrize
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path = Path()
      // parametrize
      ..lineTo(curveWidth + 5, 0)
      //main right curve:
      ..cubicTo(
        curveWidth,
        15.hsbt0,
        curveWidth - 33.wsbt0,
        curveHeight - 1.hsbt0,
        curveWidth - 100.wsbt0,
        curveHeight,
      )
      ..lineTo(0, curveHeight)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
