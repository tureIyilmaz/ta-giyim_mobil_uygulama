import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentAppPageId;
  final Function(int) onItemTapped;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.currentAppPageId,
    required this.onItemTapped,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => widget.onItemTapped(widget.index),
      minWidth: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: widget.currentAppPageId == widget.index
                ? Colors.blue
                : Colors.black,
          ),
          Text(
            widget.label,
            style: TextStyle(
              color: widget.currentAppPageId == widget.index
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
