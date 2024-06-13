import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_luck/theme/colors.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../helper/snackbar.dart';
import '../../models/plan.dart';
import '../../services/plans/index.dart';
import '../../theme/text_style.dart';
import '../../widgets/form/button.dart';
import 'help_support.dart';

class PremiumSheet extends StatefulWidget {
  final Plan plan;
  final int index;

  const PremiumSheet({
    super.key,
    required this.plan,
    required this.index,
  });

  @override
  State<PremiumSheet> createState() => _PremiumSheetState();
}

class _PremiumSheetState extends State<PremiumSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            if (Platform.isIOS) ...[
              ListTile(
                leading: const Icon(FontAwesomeIcons.coins,color: darkGreen,),
                onTap: () async {
                  context.loaderOverlay.show();
                  try {
                    var product =
                    await PlanService.getInApp(widget.plan.appleId!);
                    context.loaderOverlay.hide();
                    await PlanService.buy(product.first);
                  } on PlatformException catch (e) {
                    context.loaderOverlay.hide();
                    showToast(e.message ?? e.details);
                  }
                },
                title: Text('In-App Purchase',style: mediumSemiBold(primaryBlack),),
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: const Icon(FontAwesomeIcons.solidWindowRestore,color: darkGreen,),
                onTap: () async {
                  context.loaderOverlay.show();
                  try {
                    var product =
                    await PlanService.getInApp(widget.plan.appleId!);
                    context.loaderOverlay.hide();
                    await PlanService.buy(product.first);
                  } on PlatformException catch (e) {
                    context.loaderOverlay.hide();
                    showToast(e.message ?? e.details);
                  }
                },
                title: Text('Restore Purchase',style: mediumSemiBold(primaryBlack),),
              ),
            ],
            if (Platform.isAndroid) ...[
              ListTile(
                leading: const Icon(Icons.atm_outlined),
                onTap: () async {
                  context.loaderOverlay.show();
                  try {
                    var link = await PlanService.getLink(widget.plan.planId!);
                    context.loaderOverlay.hide();
                    launchUrlString(link);
                  } on FirebaseFunctionsException catch (e) {
                    context.loaderOverlay.hide();
                    SnackbarHelper.displayToastMessage(
                      context: context,
                      message: e.message!,
                    );
                  }
                },
                title: const Text('Pay with Paystack'),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () async {
                  context.loaderOverlay.show();
                  try {
                    var info = await PlanService.getBankInfo();

                    context.loaderOverlay.hide();
                    await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Bank Information'),
                        content: SizedBox(
                          height: 30.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Account number: ${info.number}'),
                              Text('Account bank: ${info.bank}'),
                              Text('Account name: ${info.name}'),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text('Kindly share your proof of payment'),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    child: CustomButton(
                                      function: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => const SupportPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Contact Us',
                                        style: mediumText(
                                          Colors.white,
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
                    );
                  } on FirebaseException catch (e) {
                    context.loaderOverlay.hide();
                    print(e.message);
                  }
                },
                leading: const Icon(FontAwesomeIcons.buildingColumns),
                title: const Text('Pay with bank transfer'),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () async {
                  var crypto = await PlanService.getCryptoInfo();

                  await showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Center(
                        child: Text(
                          'USDT Payment',
                          style: mediumBold(primaryBlack),
                        ),
                      ),
                      content: SizedBox(
                        height: 30.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address - ${crypto.address}',
                              style: mediumBold(primaryBlack),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Network - ${crypto.network}',
                              style: mediumBold(primaryBlack),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Kindly share your proof of payment for confirmation',
                              style: medium(),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final data = ClipboardData(
                                  text: crypto.address,
                                );
                                Clipboard.setData(data);
                                print(data);
                                // SnackbarHelper.displayToastMessage(
                                //   context: context,
                                //   message: "Address Copied",
                                //   color: darkGreen,
                                // );
                                showToast("Address Copied");
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: darkGreen,
                                  foregroundColor: darkGreen),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Copy Address',
                                    style: smallBold(primaryWhite),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.copy,
                                    color: primaryWhite,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                leading: const Icon(FontAwesomeIcons.coins),
                title: const Text('Pay with USDT (TRC 20)'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
