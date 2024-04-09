import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_luck/theme/text_style.dart';

import '../../helper/snackbar.dart';
import '../../theme/colors.dart';

class PremiumTips extends StatelessWidget {
  const PremiumTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: lightGreen, borderRadius: BorderRadius.circular(0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: height * 0.17,
                width: width,
                decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: darkGreen,width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              // const CircleAvatar(),
                              const SizedBox(width: 5),
                              Text(
                                'Barcelona',
                                style: smallBold(primaryBlack),
                              ),
                            ],
                          ),
                          Text(
                            "VS",
                            style: smallBold(darkGreen),
                          ),
                          Row(
                            children: [
                              Text(
                                'PSG',
                                style: smallBold(primaryBlack),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              // const CircleAvatar(),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text('Date:',style: smallText(primaryBlack),),
                              const SizedBox(width: 5,),
                              Text('31/03/2024',style: smallBold(darkGreen),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Time:',
                                style: smallText(primaryBlack),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '1:30pm',
                                style: smallBold(darkGreen),
                              )
                            ],
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Booking code: ',
                            style: smallText(primaryBlack),
                          ),
                          SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: () {
                              final data = ClipboardData(
                                text: 'BSDGTD',
                              );
                              Clipboard.setData(data);
                              SnackbarHelper.displayToastMessage(
                                context: context,
                                message: "BetCode Copied",
                                color: darkGreen,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: lightGreen,
                                foregroundColor: darkGreen),
                            child: Row(
                              children: [
                                Text(
                                  'BSDGTD',
                                  style: smallBold(darkGreen),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.copy,
                                  color: darkGreen,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: height * 0.17,
                width: width,
                decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: darkGreen,width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              // const CircleAvatar(),
                              const SizedBox(width: 5),
                              Text(
                                'Liverpool',
                                style: smallBold(primaryBlack),
                              ),
                            ],
                          ),
                          Text(
                            "VS",
                            style: smallBold(darkGreen),
                          ),
                          Row(
                            children: [
                              Text(
                                'Atlanta',
                                style: smallBold(primaryBlack),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              // const CircleAvatar(),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text('Date:',style: smallText(primaryBlack),),
                              const SizedBox(width: 5,),
                              Text('31/03/2024',style: smallBold(darkGreen),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Time:',
                                style: smallText(primaryBlack),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '1:30pm',
                                style: smallBold(darkGreen),
                              )
                            ],
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Booking code: ',
                            style: smallText(primaryBlack),
                          ),
                          SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: () {
                              final data = ClipboardData(
                                text: 'BSDGTD',
                              );
                              Clipboard.setData(data);
                              SnackbarHelper.displayToastMessage(
                                context: context,
                                message: "BetCode Copied",
                                color: darkGreen,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: lightGreen,
                                foregroundColor: darkGreen),
                            child: Row(
                              children: [
                                Text(
                                  'BSDGTD',
                                  style: smallBold(darkGreen),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.copy,
                                  color: darkGreen,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

