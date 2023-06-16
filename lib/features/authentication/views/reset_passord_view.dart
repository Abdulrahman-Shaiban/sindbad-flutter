// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_validation/flutter_validation.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
//
// class ResetPasswordView extends ConsumerStatefulWidget {
//   const ResetPasswordView({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   ConsumerState createState() => _OtpVerificationViewState();
// }
//
// class _OtpVerificationViewState extends ConsumerState<ResetPasswordView> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController otpController = TextEditingController();
//   StreamController<ErrorAnimationType> errorController =
//       StreamController<ErrorAnimationType>();
//   final passwordController = TextEditingController();
//   final passwordConfirmationController = TextEditingController();
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.endOfFrame.then(
//       (_) async {
//         // ref.read(resetPasswordViewController).listener(context: context);
//       },
//     );
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final state = ref.watch(authenticationStateNotifierProvider);
//
//     // otpController.text =
//     //     ref.read(resetPasswordObjectProvider.notifier).state.otp ?? "";
//
//     return Scaffold(
//       body: SizedBox(
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             // Align(
//             //   alignment: Alignment.center,
//             //   child: SingleChildScrollView(
//             //     padding: const EdgeInsets.all(32),
//             //     child: Form(
//             //       key: formKey,
//             //       child: Column(
//             //         crossAxisAlignment: CrossAxisAlignment.start,
//             //         children: [
//             //           Text(
//             //             AppLocalizations.of(context)!.verifyIdentity,
//             //             style: Theme.of(context)
//             //                 .textTheme
//             //                 .headlineLarge!
//             //                 .copyWith(color: AppColors.primaryDarkColor),
//             //           ),
//             //           const SizedBox(
//             //             height: 20,
//             //           ),
//             //           PinCodeTextField(
//             //             key: const Key('otp'),
//             //             length: 6,
//             //             obscureText: false,
//             //             appContext: context,
//             //             controller: otpController,
//             //             errorAnimationController: errorController,
//             //             keyboardType: TextInputType.number,
//             //             validator: MultiValidator([
//             //               Validator.of(context)!.required(
//             //                 AppLocalizations.of(context)!.otp,
//             //               ),
//             //               Validator.of(context)!.minLength(
//             //                   AttributeLocalizations.of(context)!.phone, 6),
//             //             ]),
//             //             onSaved: (otp) {
//             //               ref.read(resetPasswordObjectProvider).otp = otp;
//             //             },
//             //             animationType: AnimationType.fade,
//             //             pinTheme: PinTheme(
//             //                 shape: PinCodeFieldShape.box,
//             //                 borderRadius: BorderRadius.circular(5),
//             //                 fieldHeight: 50,
//             //                 fieldWidth: 40,
//             //                 borderWidth: 1.5,
//             //                 activeFillColor: AppColors.backgroundMediumColor,
//             //                 inactiveFillColor: AppColors.white,
//             //                 inactiveColor: AppColors.backgroundDarkColor,
//             //                 errorBorderColor: Colors.red,
//             //                 activeColor: AppColors.primaryColor,
//             //                 selectedColor: AppColors.primaryDarkColor,
//             //                 selectedFillColor: AppColors.backgroundColor),
//             //             animationDuration: const Duration(milliseconds: 300),
//             //             enableActiveFill: true,
//             //             onCompleted: (v) {},
//             //             onChanged: (value) {
//             //               // currentText = value;
//             //             },
//             //             beforeTextPaste: (text) {
//             //               //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//             //               //but you can show anything you want here, like your pop up saying wrong paste format or etc
//             //               return true;
//             //             },
//             //           ),
//             //           Align(
//             //             alignment: Alignment.bottomRight,
//             //             child: GestureDetector(
//             //               onTap: () =>
//             //                   ref.read(resetPasswordViewController).submit(
//             //                         context: context,
//             //                       ),
//             //               child: Container(
//             //                 height: 4.hs,
//             //                 width: 35.ws,
//             //                 margin: const EdgeInsets.only(
//             //                     top: 0, bottom: 20, left: 4, right: 4),
//             //                 child: Row(
//             //                   children: [
//             //                     Text(
//             //                       AppLocalizations.of(context)!.resendIt,
//             //                       style: Theme.of(context).textTheme.bodyMedium,
//             //                     ),
//             //                     const SizedBox(
//             //                       width: 10,
//             //                     ),
//             //                     if (state is OtpCodeLoading ||
//             //                         state is LoginRequestLoading ||
//             //                         state is SignUpConfirmLoading)
//             //                       const SizedBox(
//             //                         height: 13,
//             //                         width: 13,
//             //                         child: CircularProgressIndicator(
//             //                           strokeWidth: 2,
//             //                         ),
//             //                       ),
//             //                   ],
//             //                 ),
//             //               ),
//             //             ),
//             //           ),
//             //           TextFormField(
//             //             key: const Key('password'),
//             //             controller: passwordController,
//             //             textInputAction: TextInputAction.next,
//             //             obscureText: true,
//             //             decoration: InputDecoration(
//             //                 labelText:
//             //                     AppLocalizations.of(context)!.newPassword),
//             //             validator: MultiValidator([
//             //               Validator.of(context)!.required(
//             //                 AppLocalizations.of(context)!.newPassword,
//             //               ),
//             //               Validator.of(context)!.minLength(
//             //                   AppLocalizations.of(context)!.newPassword, 8),
//             //             ]),
//             //           ),
//             //           const SizedBox(
//             //             height: 10,
//             //           ),
//             //           TextFormField(
//             //             key: const Key('confirm_password'),
//             //             controller: passwordConfirmationController,
//             //             textInputAction: TextInputAction.done,
//             //             obscureText: true,
//             //             decoration: InputDecoration(
//             //               labelText: AppLocalizations.of(context)!
//             //                   .newPasswordConfirmation,
//             //             ),
//             //             validator: MultiValidator([
//             //               Validator.of(context)!.required(
//             //                   AppLocalizations.of(context)!
//             //                       .newPasswordConfirmation),
//             //               Validator.of(context)!.minLength(
//             //                   AppLocalizations.of(context)!
//             //                       .newPasswordConfirmation,
//             //                   8),
//             //               Validator.of(context)!.match(
//             //                 AppLocalizations.of(context)!
//             //                     .newPasswordConfirmation,
//             //                 AppLocalizations.of(context)!
//             //                     .password
//             //                     .toLowerCase(),
//             //                 () => passwordController.text,
//             //               )
//             //             ]),
//             //             onSaved: (password) {
//             //               ref.read(resetPasswordObjectProvider).password =
//             //                   password;
//             //             },
//             //           ),
//             //           const SizedBox(
//             //             height: 30,
//             //           ),
//             //           ElevatedButton(
//             //             onPressed: () {
//             //               if (formKey.currentState!.validate()) {
//             //                 formKey.currentState!.save();
//             //                 ref
//             //                     .read(resetPasswordViewController)
//             //                     .submit(context: context);
//             //               }
//             //             },
//             //             child: SizedBox(
//             //               height: 40,
//             //               child: Center(
//             //                 child: state is ResetPasswordLoading
//             //                     ? const SizedBox(
//             //                         height: 20,
//             //                         width: 20,
//             //                         child: CircularProgressIndicator(
//             //                           valueColor: AlwaysStoppedAnimation<Color>(
//             //                               Colors.white),
//             //                           strokeWidth: 3,
//             //                         ),
//             //                       )
//             //                     : Text(AppLocalizations.of(context)!
//             //                         .resetPassword),
//             //               ),
//             //             ),
//             //           ),
//             //           const SizedBox(
//             //             height: 5,
//             //           ),
//             //           ElevatedButton(
//             //             onPressed: () {
//             //               ref
//             //                   .read(resetPasswordViewController)
//             //                   .navigateToPreviousView(context: context);
//             //             },
//             //             child: SizedBox(
//             //               height: 40,
//             //               child: Center(
//             //                 child: Text(
//             //                   AppLocalizations.of(context)!.previous,
//             //                 ),
//             //               ),
//             //             ),
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     otpController.dispose();
//     errorController.close();
//
//     super.dispose();
//   }
// }
