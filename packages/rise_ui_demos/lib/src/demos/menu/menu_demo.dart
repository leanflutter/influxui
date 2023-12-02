import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class MenuDemo extends StatelessWidget {
  const MenuDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(40),
      child: const Menu(
        items: [
          MenuItem(
            icon: TablerIcons.settings,
            label: 'Settings',
          ),
          MenuItem(
            icon: TablerIcons.message,
            label: 'Messages',
          ),
          MenuItem(
            icon: TablerIcons.photo,
            label: 'Gallery',
          ),
          MenuItem(
            icon: TablerIcons.search,
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
