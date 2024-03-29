import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_luck/pages/drawer/home_drawer.dart';
import 'package:green_luck/pages/games/free_games.dart';
import 'package:green_luck/pages/games/premium_tips.dart';
import 'package:green_luck/theme/colors.dart';
import 'package:green_luck/widgets/auth/account_header.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../services/auth/index.dart';
import '../../theme/text_style.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController tabController;
  String type = 'Free';

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var weight = MediaQuery.of(context).size.width;
    var user = AuthService.getCurrentUser()!;
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        backgroundColor: darkGreen,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: primaryWhite,
              size: 25,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              user.displayName ?? 'Guest',
              style: mediumBold(primaryWhite),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              child: Icon(Icons.person),
              // radius: 25,
            ),
          ],
        ),
      ),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * .2,
              width: weight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: darkGreen,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Convert Your Booking Code!',
                    style: GoogleFonts.montaguSlab(
                      textStyle: TextStyle(
                        color: primaryBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Powered by',
                        style: smallBold(primaryBlack),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        child: Image(
                          image: AssetImage('assets/bLogo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://betcode.page.link/app';
                      if (await canLaunchUrlString(url)) {
                        await launchUrlString(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkGreen,
                        border: Border.all(color: primaryWhite, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 45.0,
                          vertical: 10,
                        ),
                        child: Text(
                          'Convert Now',
                          style: smallBold(primaryWhite),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Bet Of The Day',
              style: largeText(darkGreen),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.07,
              color: primaryWhite,
              child: TabBar(
                onTap: (i) => setState(() {
                  type = i == 0 ? 'Free' : 'Paid';
                }),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: darkGreen,
                ),
                controller: tabController,
                isScrollable: false,
                unselectedLabelColor: primaryBlack,
                labelColor: primaryWhite,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Text(
                      'Free Tips',
                      style: medium(),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Premium Tips',
                      style: medium(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  FreeTips(),
                  PremiumTips(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
