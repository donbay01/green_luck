import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../helper/date.dart';
import '../../helper/snackbar.dart';
import '../../models/code.dart';
import '../../models/user.dart';
import '../../services/code/index.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';

class GameCard extends StatelessWidget {
  final Code code;
  final UserModel user;

  const GameCard({
    super.key,
    required this.code,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    var height = 100.h;
    var width = 100.w;

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var game = code.games[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: height * 0.17,
                    width: width,
                    decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: darkGreen, width: 2),
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
                                    game.homeTeamName,
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
                                    game.awayTeamName,
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
                                  Text(
                                    'Date:',
                                    style: smallText(primaryBlack),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    DateHelper.formateDay(
                                      game.estimateStartTime,
                                    ),
                                    style: smallBold(darkGreen),
                                  )
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
                                    DateHelper.formateDate(
                                      game.estimateStartTime,
                                    ),
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
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final data = ClipboardData(
                                    text: code.code,
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
                                      code.code,
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
                if (user.role == 'admin') ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => CodeService.deleteCode(
                          code.collection,
                          code.id,
                        ),
                        icon: const Icon(
                          Icons.delete,
                          color: primaryBlack,
                        ),
                      ),
                    ],
                  )
                ],
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 0.5.h,
      ),
      itemCount: code.games.length,
    );
  }
}
