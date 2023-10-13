import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/size_config.dart';

class CachedErrorWidget extends StatelessWidget {
  const CachedErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight * 0.25,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.75)),
      child: Center(
        child: Text(
          "Sorry, no image found",
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ),
    );
  }
}
