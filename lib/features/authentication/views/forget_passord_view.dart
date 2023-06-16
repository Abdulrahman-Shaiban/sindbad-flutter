// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_validation/flutter_validation.dart';
//
// class ForgetPasswordView extends ConsumerStatefulWidget {
//   const ForgetPasswordView({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   ConsumerState createState() => _LoginViewState();
// }
//
// class _LoginViewState extends ConsumerState<ForgetPasswordView> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController phoneController = TextEditingController();
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.endOfFrame.then(
//       (_) async {
//         // ref.read(forgetPasswordViewController).listener(context: context);
//       },
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final state = ref.watch(authenticationStateNotifierProvider);
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
//             //             AppLocalizations.of(context)!.forgetPassword,
//             //             style: Theme.of(context)
//             //                 .textTheme
//             //                 .headlineLarge!
//             //                 .copyWith(color: AppColors.primaryDarkColor),
//             //           ),
//             //           const SizedBox(
//             //             height: 20,
//             //           ),
//             //           TextFormField(
//             //               key: const Key('phone'),
//             //               controller: phoneController,
//             //               keyboardType: TextInputType.phone,
//             //               textInputAction: TextInputAction.next,
//             //               decoration: InputDecoration(
//             //                 labelText: AppLocalizations.of(context)!.phone,
//             //               ),
//             //               inputFormatters: <TextInputFormatter>[
//             //                 FilteringTextInputFormatter.digitsOnly
//             //               ],
//             //               validator: MultiValidator([
//             //                 Validator.of(context)!.minLength(
//             //                     AttributeLocalizations.of(context)!.phone, 9),
//             //                 Validator.of(context)!.pattern(
//             //                   AttributeLocalizations.of(context)!.phone,
//             //                   yemeniPhoneRegex,
//             //                 ),
//             //               ]),
//             //               onSaved: (phone) {
//             //                 ref.read(resetPasswordObjectProvider).phone = phone;
//             //               }),
//             //           const SizedBox(
//             //             height: 40,
//             //           ),
//             //           ElevatedButton(
//             //             onPressed: () {
//             //               if (formKey.currentState!.validate()) {
//             //                 formKey.currentState!.save();
//             //                 ref
//             //                     .read(forgetPasswordViewController)
//             //                     .submit(context: context);
//             //               }
//             //             },
//             //             child: SizedBox(
//             //               height: 40,
//             //               child: Center(
//             //                 child: state is ResetPasswordGetOtpLoading
//             //                     ? const SizedBox(
//             //                         height: 20,
//             //                         width: 20,
//             //                         child: CircularProgressIndicator(
//             //                           valueColor: AlwaysStoppedAnimation<Color>(
//             //                               Colors.white),
//             //                           strokeWidth: 3,
//             //                         ),
//             //                       )
//             //                     : Text(AppLocalizations.of(context)!.resetPassword),
//             //               ),
//             //             ),
//             //           ),
//             //           const SizedBox(
//             //             height: 5,
//             //           ),
//             //           ElevatedButton(
//             //             onPressed: () {
//             //               ref
//             //                   .read(forgetPasswordViewController)
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
//     phoneController.dispose();
//     super.dispose();
//   }
// }
