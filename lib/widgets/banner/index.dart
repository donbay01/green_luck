import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zap_sizer/zap_sizer.dart';

import '../../models/banner.dart';
import '../../services/banner/index.dart';

class AppBanner extends StatefulWidget {
  const AppBanner({super.key});

  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  List<BannerModel>? banners;

  @override
  void initState() {
    BannerService.getBanners().then((value) {
      setState(() {
        banners = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (banners == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return FlutterCarousel(
      options: CarouselOptions(
        height: 15.h,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        showIndicator: false,
        slideIndicator: const CircularSlideIndicator(),
      ),
      items: banners?.map((banner) {
        return GestureDetector(
          onTap: () => launchUrlString(
            banner.webpage,
            mode: LaunchMode.externalApplication,
          ),
          child: CachedNetworkImage(
            imageUrl: banner.url,
          ),
        );
      }).toList(),
    );
  }
}
