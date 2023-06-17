import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/squircle.helper.dart';
import '../../data/models/address.dart';
import 'map.dialog.dart';

class AddressListWidget extends ConsumerWidget {
  const AddressListWidget({
    Key? key,
    required this.address,
  }) : super(key: key);

  final List<Address> address;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return address.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.emptyDataMessage(
                AppLocalizations.of(context)!.orders,
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 30),
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: address.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20.0, left: 15, right: 15),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: squircle(radius: 0.01),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0.0, 4.0),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    address[index].addressName!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                        width: 60,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              backgroundColor: AppColors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              side: const BorderSide(
                                                color: AppColors.grey,
                                              )),
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              'تعديل',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: 15,
                                                    color: AppColors.grey,
                                                  ),
                                              strutStyle: const StrutStyle(
                                                height: 1,
                                                forceStrutHeight: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 7),
                                      SizedBox(
                                        height: 25,
                                        width: 60,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              side: const BorderSide(
                                                color: AppColors.primaryColor,
                                              )),
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              'اختيار',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: 15,
                                                    color: AppColors.white,
                                                  ),
                                              strutStyle: const StrutStyle(
                                                height: 1,
                                                forceStrutHeight: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: -5,
                            left: 10,
                            child: IconButton(
                              icon: const Icon(Icons.delete_forever_outlined,
                                  color: AppColors.grey, size: 27),
                              onPressed: () {},
                            ))
                      ],
                    );
                  },
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: BorderSide.none,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapScreen()),
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'إضافة عنوان',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 19,
                                      color: AppColors.white,
                                    ),
                            strutStyle: const StrutStyle(
                              height: 1,
                              forceStrutHeight: true,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.add,
                            size: 23,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
