import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/home/widgets/tab_item.dart';

class TabContainer extends StatefulWidget {
  final List<Source> newsSources;
  const TabContainer({super.key, required this.newsSources});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.newsSources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: widget.newsSources.map((source) {
              return TabItem(
                  source: source,
                  isSelected:
                      selectedIndex == widget.newsSources.indexOf(source));
            }).toList(),
          )
        ],
      ),
    );
  }
}
