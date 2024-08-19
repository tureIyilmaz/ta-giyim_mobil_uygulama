import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../side_bar_items.dart';

class SideBar extends StatelessWidget {
  final Function(bool) onToggleTheme;
  final bool isDarkMode;

  const SideBar({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/img/kafa.jpg'),
                  ),
                  const Text(
                    'Türel Yılmaz',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.subdirectory_arrow_left,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleSwitch(
                    minWidth: 90.0,
                    initialLabelIndex: isDarkMode ? 1 : 0,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: const ['Light', 'Dark'],
                    icons: const [Icons.light_mode, Icons.dark_mode],
                    activeBgColors: const [
                      [Colors.lime],
                      [Colors.black]
                    ],
                    onToggle: (index) {
                      bool isOn = index == 1;
                      onToggleTheme(isOn);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const SideBarItems(
                icon: Icon(Icons.settings),
                text: 'Ayarlar',
              ),
              const SideBarItems(
                icon: Icon(Icons.wallet),
                text: 'Cüzdan',
              ),
              const SideBarItems(
                icon: Icon(Icons.support_agent_rounded),
                text: 'Destek',
              ),
              const SideBarItems(
                icon: Icon(Icons.contact_support_rounded),
                text: 'Yardım',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
