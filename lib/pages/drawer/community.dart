import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        title: Text(
          'Join our community',
          style: mediumBold(primaryWhite),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: primaryWhite,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Image(
                height: MediaQuery.of(context).size.height * 0.3,
                image: const AssetImage('assets/community.png')),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.twitter,
                        color: primaryWhite,
                        size: 60,
                      ),
                      onPressed: () async {
                        final url = 'https://twitter.com/Wappyking_';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                            enableJavaScript: true,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Follow on Twitter',
                    style: mediumBold(primaryBlack),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: darkGreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.telegram,
                        color: primaryWhite,
                        size: 60,
                      ),
                      onPressed: () async {
                        final url = 'https://t.me/Greenluck7';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                            enableJavaScript: true,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Join our Telegram',
                    style: mediumBold(primaryBlack),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
