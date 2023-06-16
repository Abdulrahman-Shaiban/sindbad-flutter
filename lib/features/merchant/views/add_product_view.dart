import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import 'widgets/add_offers_widget.dart';
import 'widgets/add_products_widget.dart';

final tabIndexProvider = StateProvider<int>(
  (ref) => 0,
);

class AddProductView extends ConsumerStatefulWidget {
  const AddProductView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<AddProductView>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.addProduct,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.wsbt0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 0.9,
                    color: AppColors.grey,
                  ),
                ),
                padding: EdgeInsets.zero,
                child: TabBar(
                  controller: tabController,
                  isScrollable: false,
                  dividerColor: AppColors.primaryColor,
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.grey,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  splashBorderRadius: BorderRadius.circular(
                    50,
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(
                    AppColors.grey,
                  ),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: AppColors.primaryColor),
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  tabs: [
                    Tab(
                      text: AppLocalizations.of(context)!.mainProduct,
                    ),
                    Tab(
                      text: AppLocalizations.of(context)!.specialOffer,
                    ),
                  ],
                  onTap: (index) {
                    ref.read(tabIndexProvider.notifier).state = index;
                  },
                ),
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.6.ws,
              ),
              child: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  AddProductsWidget(),
                  AddOffersWidget(),
                ],
              ),
            ),
          ),
        ],
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

class ImagesContainersList extends StatelessWidget {
  const ImagesContainersList({
    super.key,
    required this.primaryImageFileProvider,
    required this.secondaryImageFile1Provider,
    required this.secondaryImageFile2Provider,
    required this.secondaryImageFile3Provider,
  });

  final StateProvider<File?> primaryImageFileProvider;
  final StateProvider<File?> secondaryImageFile1Provider;
  final StateProvider<File?> secondaryImageFile2Provider;
  final StateProvider<File?> secondaryImageFile3Provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageContainerWidth,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ImageContainer(
            color: AppColors.primaryColor,
            text: AppLocalizations.of(context)!.primary,
            stateProvider: primaryImageFileProvider,
          ),
          SizedBox(
            width: 1.wsbt0,
          ),
          ImageContainer(
            stateProvider: secondaryImageFile1Provider,
          ),
          SizedBox(
            width: 1.wsbt0,
          ),
          ImageContainer(
            stateProvider: secondaryImageFile2Provider,
          ),
          SizedBox(
            width: 1.wsbt0,
          ),
          ImageContainer(
            stateProvider: secondaryImageFile3Provider,
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends ConsumerWidget {
  ImageContainer({
    Key? key,
    this.color,
    this.text,
    required this.stateProvider,
  }) : super(key: key);

  Color? color;
  String? text;
  final StateProvider<File?> stateProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ImagePicker()
            .pickImage(
          source: ImageSource.gallery,
        )
            .then((pickedFile) async {
          if (pickedFile != null) {
            ref.read(stateProvider.notifier).state = File(pickedFile.path);
          }
        });
      },
      child: Container(
          height: imageContainerWidth,
          width: imageContainerWidth,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.5,
              color: color ?? AppColors.grey,
            ),
          ),
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: ref.watch(stateProvider) != null
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(
                              ref.watch(stateProvider)!,
                            ),
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(13),
                            topLeft: Radius.circular(13),
                          ),
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            topLeft: Radius.circular(13),
                          ),
                        ),
                        child: Text(
                          text ?? AppLocalizations.of(context)!.secondary,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: color ?? AppColors.grey),
                        ),
                      ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(13),
                      bottomRight: Radius.circular(13),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
