import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_luck/pages/drawer/home_drawer.dart';
import 'package:green_luck/pages/games/free_games.dart';
import 'package:green_luck/pages/games/premium_tips.dart';
import 'package:green_luck/providers/auth.dart';
import 'package:green_luck/services/fcm.dart';
import 'package:green_luck/services/plans/index.dart';
import 'package:green_luck/theme/colors.dart';
import 'package:green_luck/widgets/form/admin_textfield.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zap_sizer/zap_sizer.dart';

import '../../services/auth/index.dart';
import '../../theme/text_style.dart';
import '../../widgets/banner/index.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage>
    with TickerProviderStateMixin {
  late TabController tabController;
  String type = 'Free';

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    fcmSetup();
    super.initState();
  }

  fcmSetup() async {
    var token = await FCMService.getToken();
    if (token != null) {
      await AuthService.updateUser({'token': token});
    }
    await FCMService.subscribeTopic();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var usermodel = ref.watch(userProvider);

    var user = AuthService.getCurrentUser()!;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: lightGreen,
        appBar: AppBar(
          backgroundColor: darkGreen,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
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
                usermodel?.displayName ?? 'Guest',
                style: mediumBold(primaryWhite),
              ),
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png')),
            ],
          ),
        ),
        drawer: const HomeDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const AppBanner(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Bet Of The Day',
                style: largeText(darkGreen),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 7.h,
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
              if (usermodel?.role == 'admin') ...[
                AdminTextField(
                  index: tabController.index,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
