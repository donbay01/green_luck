
import 'package:flutter/material.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import '../../models/plan.dart';
import '../../services/plans/index.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: height * 0.43,
              width: width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: primaryWhite, width: 2)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Weekly Plan',
                      style: mediumSemiBold(primaryWhite),
                    ),
                    Text(
                      'Price: N7500',
                      style: mediumSemiBold(primaryWhite),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' - Access to Premium Tips',
                      style: mediumText(primaryWhite),
                    ),
                    Text(
                      ' - Access to the Worksheet',
                      style: mediumText(primaryWhite),
                    ),
                    Text(
                      ' - Access to Free Rollover challenges',
                      style: mediumText(primaryWhite),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: Text(
                        ' Get Plan',
                        style: mediumText(primaryBlack),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryWhite,
                        foregroundColor: primaryBlack,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              height: height * 0.43,
              width: width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: primaryWhite, width: 2)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Monthly Plan',
                      style: mediumSemiBold(primaryWhite),
                    ),
                    Text(
                      'Price: N250000',
                      style: mediumSemiBold(primaryWhite),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' - Access to Premium Tips',
                      style: mediumText(primaryWhite),
                    ),
                    Text(
                      ' - Access to the Worksheet',
                      style: mediumText(primaryWhite),
                    ),
                    Text(
                      ' - Access to Free Rollover challenges',
                      style: mediumText(primaryWhite),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: Text(
                        ' Get Plan',
                        style: mediumText(primaryBlack),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryWhite,
                        foregroundColor: primaryBlack,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
