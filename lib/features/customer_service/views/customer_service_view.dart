import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/features/customer_service/views/about_us_view.dart';
import 'package:sindebad/features/customer_service/views/common_questions_view.dart';
import 'package:sindebad/features/customer_service/views/contact_us_view.dart';
import 'package:sindebad/features/customer_service/views/knowledge_base_view.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/squircle.helper.dart';

class CustomerServiceView extends ConsumerStatefulWidget {
  const CustomerServiceView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<CustomerServiceView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.customersService,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: squircle(radius: 0.015),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  'من نحن',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutUsView(),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: squircle(radius: 0.015),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  'تواصل بنا',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ContactUsView(),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: squircle(radius: 0.015),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  'قاعدة المعرفة',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const KnowledgeBaseView(),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: squircle(radius: 0.015),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  'الاسئلة الشائعة',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CommonQuestionView(),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
