import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';

final genderProvider = StateProvider<int>(
  (ref) => 0,
);
final registerInEmailBroadcastProvider = StateProvider<bool>(
  (ref) => false,
);
final acceptAppPoliciesProvider = StateProvider<bool>(
  (ref) => true,
);

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

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
                height: 19.hsbt0,
                child: Stack(
                  children: [
                    const TopClipperWidget(),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.only(top: 12.5.wsbt0),
                        child: Text(
                          AppLocalizations.of(context)!.signUp,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: AppColors.white,
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                          key: const Key('name'),
                          controller: nameController,
                          textInputAction: TextInputAction.next,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.grey),
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.userName,
                          ),
                          // validator: MultiValidator([
                          //   Validator.of(context)!
                          //       .required(AppLocalizations.of(context)!.fullName),
                          //   Validator.of(context)!
                          //       .minLength(AppLocalizations.of(context)!.fullName, 5),
                          //   Validator.of(context)!
                          //       .maxLength(AppLocalizations.of(context)!.fullName, 40),
                          //   Validator.of(context)!.name,
                          // ]),
                          onSaved: (name) {}),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          key: const Key('phone'),
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.grey),
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
                          key: const Key('email'),
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.grey),
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.email,
                          ),
                          // validator: MultiValidator([
                          //   Validator.of(context)!
                          //       .required(AppLocalizations.of(context)!.fullName),
                          //   Validator.of(context)!
                          //       .minLength(AppLocalizations.of(context)!.fullName, 5),
                          //   Validator.of(context)!
                          //       .maxLength(AppLocalizations.of(context)!.fullName, 40),
                          //   Validator.of(context)!.name,
                          // ]),
                          onSaved: (name) {}),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          key: const Key('password'),
                          controller: passwordController,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.grey),
                          decoration: InputDecoration(
                              labelText:
                                  AppLocalizations.of(context)!.password),
                          // validator: MultiValidator([
                          //   Validator.of(context)!.required(
                          //     AttributeLocalizations.of(context)!.password,
                          //   ),
                          //   Validator.of(context)!.minLength(
                          //       AttributeLocalizations.of(context)!.password, 8),
                          // ]),
                          onSaved: (password) {}),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          key: const Key('confirm_password'),
                          controller: passwordConfirmationController,
                          textInputAction: TextInputAction.next,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.grey),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!
                                .passwordConfirmation,
                          ),
                          // validator: MultiValidator([
                          //   Validator.of(context)!.required(
                          //       AppLocalizations.of(context)!
                          //           .passwordConfirmation),
                          //   Validator.of(context)!.minLength(
                          //       ValidationLocalizations.of(context)!
                          //           .passwordConfirmation,
                          //       8),
                          //   Validator.of(context)!.match(
                          //     AppLocalizations.of(context)!.passwordConfirmation,
                          //     AppLocalizations.of(context)!
                          //         .password
                          //         .toLowerCase(),
                          //         () => passwordController.text,
                          //   )
                          // ]),
                          onSaved: (password) {}),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 100.wsbt0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 5.hs,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 4),
                              child: Text(
                                AppLocalizations.of(context)!.gender,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: AppColors.grey,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 46.wsbt0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: RadioListTile<int>(
                                      groupValue: ref.watch(genderProvider),
                                      value: 0,
                                      contentPadding: EdgeInsets.zero,
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      fillColor: MaterialStatePropertyAll(
                                          ref.watch(genderProvider) == 0
                                              ? AppColors.primaryColor
                                              : AppColors.grey),
                                      onChanged: (value) {
                                        ref
                                            .read(genderProvider.notifier)
                                            .state = value ?? 0;
                                      },
                                      title: Text(
                                        AppLocalizations.of(context)!.male,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ref.watch(genderProvider) ==
                                                            0
                                                        ? AppColors.primaryColor
                                                        : AppColors.grey),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile<int>(
                                      groupValue: ref.watch(genderProvider),
                                      value: 1,
                                      contentPadding: EdgeInsets.zero,
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      fillColor: MaterialStatePropertyAll(
                                          ref.watch(genderProvider) == 1
                                              ? AppColors.primaryColor
                                              : AppColors.grey),
                                      onChanged: (value) {
                                        ref
                                            .read(genderProvider.notifier)
                                            .state = value ?? 1;
                                      },
                                      title: Text(
                                        AppLocalizations.of(context)!.female,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ref.watch(genderProvider) ==
                                                            1
                                                        ? AppColors.primaryColor
                                                        : AppColors.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100.wsbt0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 5.hs,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 4),
                                    child: Text(
                                      AppLocalizations.of(context)!.birthDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: AppColors.grey,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80.wsbt0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: TextFormField(
                                              key: const Key('day'),
                                              controller: dayController,
                                              textInputAction:
                                                  TextInputAction.next,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall!
                                                  .copyWith(
                                                      color: AppColors.grey),
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: InputDecoration(
                                                hintText: AppLocalizations.of(
                                                        context)!
                                                    .day,
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: AppColors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 10.0),
                                              ),
                                              // validator: MultiValidator([
                                              //   Validator.of(context)!.required(
                                              //       AppLocalizations.of(context)!
                                              //           .passwordConfirmation),
                                              //   Validator.of(context)!.minLength(
                                              //       ValidationLocalizations.of(context)!
                                              //           .passwordConfirmation,
                                              //       8),
                                              //   Validator.of(context)!.match(
                                              //     AppLocalizations.of(context)!.passwordConfirmation,
                                              //     AppLocalizations.of(context)!
                                              //         .password
                                              //         .toLowerCase(),
                                              //         () => passwordController.text,
                                              //   )
                                              // ]),
                                              onSaved: (password) {}),
                                        ),
                                        const Spacer(),
                                        Expanded(
                                          flex: 5,
                                          child: TextFormField(
                                              key: const Key('month'),
                                              controller: monthController,
                                              textInputAction:
                                                  TextInputAction.next,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall!
                                                  .copyWith(
                                                      color: AppColors.grey),
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: InputDecoration(
                                                hintText: AppLocalizations.of(
                                                        context)!
                                                    .month,
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: AppColors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 10.0),
                                              ),
                                              // validator: MultiValidator([
                                              //   Validator.of(context)!.required(
                                              //       AppLocalizations.of(context)!
                                              //           .passwordConfirmation),
                                              //   Validator.of(context)!.minLength(
                                              //       ValidationLocalizations.of(context)!
                                              //           .passwordConfirmation,
                                              //       8),
                                              //   Validator.of(context)!.match(
                                              //     AppLocalizations.of(context)!.passwordConfirmation,
                                              //     AppLocalizations.of(context)!
                                              //         .password
                                              //         .toLowerCase(),
                                              //         () => passwordController.text,
                                              //   )
                                              // ]),
                                              onSaved: (password) {}),
                                        ),
                                        const Spacer(),
                                        Expanded(
                                          flex: 9,
                                          child: TextFormField(
                                              key: const Key('year'),
                                              controller: yearController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall!
                                                  .copyWith(
                                                      color: AppColors.grey),
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: InputDecoration(
                                                hintText: AppLocalizations.of(
                                                        context)!
                                                    .year,
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: AppColors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 10.0),
                                              ),
                                              // validator: MultiValidator([
                                              //   Validator.of(context)!.required(
                                              //       AppLocalizations.of(context)!
                                              //           .passwordConfirmation),
                                              //   Validator.of(context)!.minLength(
                                              //       ValidationLocalizations.of(context)!
                                              //           .passwordConfirmation,
                                              //       8),
                                              //   Validator.of(context)!.match(
                                              //     AppLocalizations.of(context)!.passwordConfirmation,
                                              //     AppLocalizations.of(context)!
                                              //         .password
                                              //         .toLowerCase(),
                                              //         () => passwordController.text,
                                              //   )
                                              // ]),
                                              onSaved: (password) {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 5.hs,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 4),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .ageMustBeMoreThan18,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              color: AppColors
                                                  .secondarySwatch[500],
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100.wsbt0,
                              child: Column(
                                children: [
                                  CheckboxListTile(
                                    onChanged: (value) {
                                      ref
                                          .read(registerInEmailBroadcastProvider
                                              .notifier)
                                          .state = value ?? false;
                                    },
                                    value: ref.watch(
                                        registerInEmailBroadcastProvider),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: AppColors.primaryColor,
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      AppLocalizations.of(context)!
                                          .registerInEmailBroadcast,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: AppColors.grey,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  CheckboxListTile(
                                    onChanged: (value) {
                                      ref
                                          .read(acceptAppPoliciesProvider
                                              .notifier)
                                          .state = value ?? false;
                                    },
                                    value: ref.watch(acceptAppPoliciesProvider),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: AppColors.primaryColor,
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      AppLocalizations.of(context)!
                                          .acceptAppPolicies,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: AppColors.grey,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
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
                              AppLocalizations.of(context)!.register,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
    final double curveHeight = 18.hsbt0;
    final double curveWidth = 77.wsbt0;

    final paint = Paint()
      // parametrize
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path = Path()
      // parametrize
      ..lineTo(curveWidth + 5, 0)
      //main right curve:
      ..cubicTo(
        curveWidth - 15.wsbt0,
        15.hsbt0,
        curveWidth - 55.wsbt0,
        curveHeight - 1.hsbt0,
        curveWidth - 90.wsbt0,
        curveHeight,
      )
      ..lineTo(0, curveHeight)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
