import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:green_luck/pages/drawer/premium_sheet.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../helper/snackbar.dart';
import '../../models/plan.dart';
import '../../services/plans/index.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  var iap = PlanService.iapConnection;

  @override
  void initState() {
    iap.purchaseStream.listen((event) async {
      var all =
          event.where((e) => e.status == PurchaseStatus.purchased).toList();
      for (var i = 0; i < all.length; i++) {
        var product = all[i];
        PlanService.logSubscription(product);

        if (product.pendingCompletePurchase) {
          iap.completePurchase(product);
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = 100.h;
    var width = 100.w;

    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        title: Text(
          'Go Premium',
          style: mediumText(primaryWhite),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: primaryWhite,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: PaginateFirestore(
          separator: const SizedBox(
            height: 20,
          ),
          shrinkWrap: true,
          itemBuilder: (context, snapshots, index) {
            var snap = snapshots[index];
            var plan = Plan.fromJSON(
              snap.id,
              snap.data() as dynamic,
            );

            return Center(
              child: Container(
                height: height * 0.6,
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: HexColor(plan.color),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: primaryBlack, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${plan.name}',
                        style: mediumSemiBold(primaryBlack),
                      ),
                      Text(
                        'Price: N${plan.amount ~/ 100}',
                        style: mediumSemiBold(primaryBlack),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Premium subscription unlocks the following ',
                        style: mediumText(primaryBlack),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' - Access to Premium Tips',
                        style: mediumText(primaryBlack),
                      ),
                      Text(
                        ' - Minimum of 2 Premium tips are daily',
                        style: tiny(primaryBlack),
                      ),
                      Text(
                        ' -  Access to the Worksheet',
                        style: mediumText(primaryBlack),
                      ),
                      Text(
                        ' - Worksheet comprises of the best games for the weekend. To be shared every weekend',
                        style: tiny(primaryBlack),
                      ),
                      Text(
                        ' - Access to Rollover challenges',
                        style: mediumText(primaryBlack),
                      ),
                      Text(
                        ' - Enjoy minimum of  2 premium rollover slips',
                        style: tiny(primaryBlack),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await showModalBottomSheet(
                            context: context,
                            builder: (_) => PremiumSheet(
                              plan: plan,
                              index: index,
                            ),
                          );
                        },
                        child: Text(
                          ' Get Plan',
                          style: mediumText(primaryWhite),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkGreen,
                          foregroundColor: primaryWhite,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          query: PlanService.getPlans(),
          itemBuilderType: PaginateBuilderType.listView,
        ),
      ),
    );
  }
}
