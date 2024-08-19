// ignore_for_file: library_private_types_in_public_api

import 'package:e_ticaret_mobil_uygulama/bottom_nav_bar/bottom_nav_bar_pages/compare/compare.dart';
import 'package:flutter/material.dart';

import '../widgets/nav_item.dart';
import 'bottom_nav_bar_pages/cart/cart_button.dart';
import 'bottom_nav_bar_pages/cart/route_cart.dart';
import 'bottom_nav_bar_pages/favorite/favorite.dart';
import 'bottom_nav_bar_pages/home/home.dart';
import 'bottom_nav_bar_pages/profile/profile.dart';

final GlobalKey<_BottomNavBarState> bottomNavBarKey =
    GlobalKey<_BottomNavBarState>();

class BottomNavBar extends StatefulWidget {
  final Function(bool) onToggleTheme;
  final bool isDarkMode;
  const BottomNavBar({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentAppPageId = 0;
  late List<Widget> bottomAppBarPages;

  @override
  void initState() {
    super.initState();
    bottomAppBarPages = [
      HomePage(
          onToggleTheme: widget.onToggleTheme, isDarkMode: widget.isDarkMode),
      const Compare(),
      const Favorite(),
      const Profile(),
    ];
  }

  final PageStorageBucket bucket = PageStorageBucket();

  void _onItemTapped(int index) {
    setState(() {
      currentAppPageId = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: bottomAppBarPages[currentAppPageId],
      ),
      floatingActionButton: CartButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) {
            return const RouteCart();
          });
          Navigator.push(context, route);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavItem(
                    icon: Icons.home,
                    label: 'Anasayfa',
                    index: 0,
                    currentAppPageId: currentAppPageId,
                    onItemTapped: _onItemTapped,
                  ),
                  NavItem(
                    icon: Icons.compare_arrows,
                    label: 'Karşılaştır',
                    index: 1,
                    currentAppPageId: currentAppPageId,
                    onItemTapped: _onItemTapped,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  NavItem(
                    icon: Icons.favorite,
                    label: 'Favori',
                    index: 2,
                    currentAppPageId: currentAppPageId,
                    onItemTapped: _onItemTapped,
                  ),
                  NavItem(
                    icon: Icons.person,
                    label: 'Profil',
                    index: 3,
                    currentAppPageId: currentAppPageId,
                    onItemTapped: _onItemTapped,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
