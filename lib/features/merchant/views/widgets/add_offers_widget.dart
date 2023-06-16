import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../add_product_view.dart';

final primaryImageFileProvider = StateProvider<File?>(
  (ref) => null,
);
final secondaryImageFile1Provider = StateProvider<File?>(
  (ref) => null,
);
final secondaryImageFile2Provider = StateProvider<File?>(
  (ref) => null,
);
final secondaryImageFile3Provider = StateProvider<File?>(
  (ref) => null,
);

final double imageContainerWidth = 21.5.wsbt0;

class AddOffersWidget extends ConsumerStatefulWidget {
  const AddOffersWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddOffersWidgetState();
}

class _AddOffersWidgetState extends ConsumerState<AddOffersWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ImagesContainersList(
              primaryImageFileProvider: primaryImageFileProvider,
              secondaryImageFile1Provider: secondaryImageFile1Provider,
              secondaryImageFile2Provider: secondaryImageFile2Provider,
              secondaryImageFile3Provider: secondaryImageFile3Provider,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                      key: const Key('price'),
                      controller: productPriceController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.grey),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.productPrice,
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
                      onSaved: (price) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      key: const Key('quantity'),
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.grey),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.quantity,
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
                      onSaved: (quantity) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      key: const Key('details'),
                      controller: detailsController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.grey),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.details,
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
                      onSaved: (details) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                              key: const Key('startDate'),
                              controller: startDateController,
                              textInputAction: TextInputAction.next,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColors.grey),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText:
                                    AppLocalizations.of(context)!.startDate,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: AppColors.grey,
                                        fontWeight: FontWeight.bold),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10.0),
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
                              onSaved: (startDate) {}),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                              key: const Key('endDate'),
                              controller: endDateController,
                              textInputAction: TextInputAction.next,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColors.grey),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.endDate,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: AppColors.grey,
                                        fontWeight: FontWeight.bold),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10.0),
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
                              onSaved: (endDate) {}),
                        ),
                        const Spacer(
                          flex: 4,
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
                          AppLocalizations.of(context)!.save,
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
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    productPriceController.dispose();
    quantityController.dispose();
    detailsController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
