import 'package:flutter/material.dart';

import '../widgets/search_items.dart';
import '../widgets/sidebar/sidebar.dart';
import 'location.dart';

class HomeAppBar extends StatefulWidget {
  final int notificationCount;
  final Function(bool) onToggleTheme;
  final bool isDarkMode;

  const HomeAppBar({
    super.key,
    required this.notificationCount,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SideBar(
                          onToggleTheme: widget.onToggleTheme,
                          isDarkMode: widget.isDarkMode,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Location()),
                          );
                        },
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'İstanbul, ',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Bağcılar',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: (widget.notificationCount != 0)
                        ? const Icon(
                            Icons.notifications_active,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const SearchItems(),
            ],
          ),
        ),
      ),
    );
  }
}
