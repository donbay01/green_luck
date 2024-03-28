import 'package:flutter/material.dart';
import 'package:green_luck/theme/colors.dart';

import '../../theme/text_style.dart';

class FreeTips extends StatelessWidget {
  const FreeTips({Key? key}) : super(key: key);

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
                                'Bayern Munich',
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
                                'Arsenal',
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
                                'Real Madrid',
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
                                'Man City',
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
                                'Atletico Madrid',
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
                                'Dortmund',
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
                              Text('14/03/2024',style: smallBold(darkGreen),)
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
                                '8:30pm',
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
