import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  _sendEmail() async {
    launch("mailto:greenluck@gmail.com");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        title: Text(
          'Help & Support',
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Image(
              height: MediaQuery.of(context).size.height * 0.3,
              image: const AssetImage('assets/support.png')),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.envelopesBulk,
                    size: 30,
                    color: darkGreen,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Send us a mail for assistance',
                    style: mediumText(primaryBlack),
                  ),
                ],
              )),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              _sendEmail();
            },
            child: Text(
              'greenluck@gmail.com',
              style: mediumText(darkGreen),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _sendEmail();
            },
            style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contact Us',
                style: mediumBold(primaryWhite),
              ),
            ),
          )
        ],
      ),
    );
  }
}
