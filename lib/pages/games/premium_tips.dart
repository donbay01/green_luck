import 'package:flutter/material.dart';
import 'package:green_luck/theme/text_style.dart';

import '../../theme/colors.dart';

class PremiumTips extends StatelessWidget {
  const PremiumTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: darkGreen, borderRadius: BorderRadius.circular(20)),
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
                              const CircleAvatar(),
                              const SizedBox(width: 5),
                              Text(
                                'Monaco',
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
                                'Strasbourg',
                                style: smallBold(primaryBlack),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const CircleAvatar(),
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
                          Container(
                            color: lightGreen,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                              child: Text(
                                'B3SGDT',
                                style: smallBold(darkGreen),
                              ),
                            ),
                          )
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
                              const CircleAvatar(),
                              const SizedBox(width: 5),
                              Text(
                                'Chelsea',
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
                                'Brentford',
                                style: smallBold(primaryBlack),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const CircleAvatar(),
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
                          Container(
                            color: lightGreen,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                              child: Text(
                                'B3SGDT',
                                style: smallBold(darkGreen),
                              ),
                            ),
                          )
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
                              const CircleAvatar(),
                              const SizedBox(width: 5),
                              Text(
                                'Benfica',
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
                                'Sporting',
                                style: smallBold(primaryBlack),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const CircleAvatar(),
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
                              Text('24/03/2024',style: smallBold(darkGreen),)
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
                                '12:30pm',
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
                          Container(
                            color: lightGreen,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                              child: Text(
                                'B3SGDT',
                                style: smallBold(darkGreen),
                              ),
                            ),
                          )
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

