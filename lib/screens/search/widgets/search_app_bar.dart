import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/size_config.dart';

class SearchAppBar extends StatefulWidget {
  final Function(String value) onSearchSaved;
  const SearchAppBar({
    super.key,
    required this.onSearchSaved,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 55.h),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.15,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.w),
            bottomRight: Radius.circular(50.w),
          ),
        ),
        child: TextField(
          controller: textEditingController,
          onSubmitted: (value) {
            widget.onSearchSaved(value);
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                if (textEditingController.text.trim().isNotEmpty) {
                  widget.onSearchSaved(textEditingController.text);
                }
              },
              icon: Icon(
                Icons.search,
                color: MyColors.primaryColor,
                size: 36,
              ),
            ),
            prefixIcon: IconButton(
                onPressed: () {
                  textEditingController.clear();
                },
                icon: Icon(
                  Icons.cancel,
                  color: MyColors.primaryColor,
                )),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            hintText: "Search article",
            hintStyle: Theme.of(context).textTheme.titleSmall,
            fillColor: MyColors.whiteColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
          ),
        )
        // child: Row(),
        );
  }
}
