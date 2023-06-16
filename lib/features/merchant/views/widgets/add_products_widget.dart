import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../add_product_view.dart';

final availabilityProvider = StateProvider<int>(
  (ref) => 0,
);

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

class AddProductsWidget extends ConsumerStatefulWidget {
  const AddProductsWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddProductsWidgetState();
}

class _AddProductsWidgetState extends ConsumerState<AddProductsWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController productArabicNameController =
      TextEditingController();
  final TextEditingController productEnglishNameController =
      TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

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
                  DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      isDense: false,
                      style: Theme.of(context).textTheme.bodyMedium,
                      items: [
                        'Test',
                        'Test1',
                        'Test2',
                        'Test3',
                        'Test4',
                        'Test5',
                        'Test6',
                      ]
                          .map(
                            (brand) => DropdownMenuItem<String>(
                              value: brand,
                              child: Text(brand),
                            ),
                          )
                          .toList(),
                      onChanged: (brand) {},
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.brandName,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      isDense: false,
                      style: Theme.of(context).textTheme.bodyMedium,
                      items: [
                        'Test',
                        'Test1',
                        'Test2',
                        'Test3',
                        'Test4',
                        'Test5',
                        'Test6',
                      ]
                          .map(
                            (category) => DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            ),
                          )
                          .toList(),
                      onChanged: (category) {},
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context)!.productCategory,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      key: const Key('arabic_name'),
                      controller: productArabicNameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.grey),
                      decoration: InputDecoration(
                        labelText:
                            "${AppLocalizations.of(context)!.productName} (${AppLocalizations.of(context)!.arabic})",
                      ),
                      // validator: MultiValidator([
                      //   Validator.of(context)!.minLength(
                      //       AttributeLocalizations.of(context)!.phone, 9),
                      //   Validator.of(context)!.pattern(
                      //     AttributeLocalizations.of(context)!.phone,
                      //     yemeniPhoneRegex,
                      //   ),
                      // ]),
                      onSaved: (arabicName) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      key: const Key('english_name'),
                      controller: productEnglishNameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.grey),
                      decoration: InputDecoration(
                        labelText:
                            "${AppLocalizations.of(context)!.productName} (${AppLocalizations.of(context)!.english})",
                      ),
                      // validator: MultiValidator([
                      //   Validator.of(context)!.minLength(
                      //       AttributeLocalizations.of(context)!.phone, 9),
                      //   Validator.of(context)!.pattern(
                      //     AttributeLocalizations.of(context)!.phone,
                      //     yemeniPhoneRegex,
                      //   ),
                      // ]),
                      onSaved: (englishName) {}),
                  const SizedBox(
                    height: 10,
                  ),
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
                  TextFormField(
                      key: const Key('status'),
                      controller: statusController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.grey),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.status,
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
                      onSaved: (status) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 100.wsbt0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 4),
                            child: Text(
                              AppLocalizations.of(context)!.productStatus,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColors.lightBlack,
                                    fontSize: 17.sp,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(1.5),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: const Offset(0.0, 4.0),
                                      ),
                                    ],
                                  ),
                                  child: RadioListTile<int>(
                                    groupValue: ref.watch(availabilityProvider),
                                    value: 0,
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    fillColor: MaterialStatePropertyAll(
                                        ref.watch(availabilityProvider) == 0
                                            ? AppColors.orange
                                            : AppColors.grey),
                                    onChanged: (value) {
                                      ref
                                          .read(availabilityProvider.notifier)
                                          .state = value ?? 0;
                                    },
                                    title: Text(
                                      AppLocalizations.of(context)!.available,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: ref.watch(
                                                          availabilityProvider) ==
                                                      0
                                                  ? AppColors.orange
                                                  : AppColors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: const Offset(0.0, 4.0),
                                      ),
                                    ],
                                  ),
                                  child: RadioListTile<int>(
                                    groupValue: ref.watch(availabilityProvider),
                                    value: 1,
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    fillColor: MaterialStatePropertyAll(
                                        ref.watch(availabilityProvider) == 1
                                            ? AppColors.orange
                                            : AppColors.grey),
                                    onChanged: (value) {
                                      ref
                                          .read(availabilityProvider.notifier)
                                          .state = value ?? 1;
                                    },
                                    title: Text(
                                      AppLocalizations.of(context)!.unavailable,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: ref.watch(
                                                          availabilityProvider) ==
                                                      1
                                                  ? AppColors.orange
                                                  : AppColors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
    statusController.dispose();
    super.dispose();
  }
}
