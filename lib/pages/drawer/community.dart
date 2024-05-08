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
            height: 70,
          ),
          Center(
            child: Image(
                height: MediaQuery.of(context).size.height * 0.3,
                image: const AssetImage('assets/community.png')),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Visit Our Website:'),
              TextButton(
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
                child: Text(
                  'www.greenlucktips.com',
                  style: mediumText(darkGreen),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blue,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Twitter',
                    style: mediumBold(primaryBlack),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.telegram,
                      color: Colors.blueGrey,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Telegram',
                    style: mediumBold(primaryBlack),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.red,
                      size: 60,
                    ),
                    onPressed: () async {
                      final url = 'https://www.instagram.com/greenlucktips_';
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: false,
                          enableJavaScript: true,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Instagram',
                    style: mediumBold(primaryBlack),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
