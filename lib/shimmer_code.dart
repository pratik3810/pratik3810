import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MainBannerShimmer extends StatefulWidget {
  const MainBannerShimmer({super.key});

  @override
  State<MainBannerShimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<MainBannerShimmer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(11)),
          height: 20.h,
        ),
      ),
    );
  }
}


