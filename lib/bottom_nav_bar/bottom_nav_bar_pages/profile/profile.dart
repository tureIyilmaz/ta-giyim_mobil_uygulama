import 'dart:math';

import 'package:e_ticaret_mobil_uygulama/bottom_nav_bar/bottom_nav_bar_pages/profile/widgets/log_in.dart';
import 'package:e_ticaret_mobil_uygulama/bottom_nav_bar/bottom_nav_bar_pages/profile/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  bool _isSignUp = false;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animationTextRotate =
        Tween<double>(begin: 0, end: pi / 2).animate(_animationController);
  }

  @override
  void initState() {
    setAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isSignUp = !_isSignUp;
                if (_isSignUp) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
            },
            child: AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height,
              left: _isSignUp ? -(MediaQuery.of(context).size.width * 0.9) : 0,
              child: Container(
                color: Colors.blue,
                child: const LoginForm(),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            width: MediaQuery.of(context).size.width * 0.9,
            left: _isSignUp
                ? (MediaQuery.of(context).size.width * 0.1)
                : (MediaQuery.of(context).size.width * 0.9),
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Colors.white,
              child: const SignUpForm(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom: _isSignUp
                ? MediaQuery.of(context).size.height * 0.45
                : MediaQuery.of(context).size.height * 0.1,
            left:
                _isSignUp ? -70 : MediaQuery.of(context).size.width * 0.45 - 90,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSignUp = !_isSignUp;
                  if (_isSignUp) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                });
              },
              child: SizedBox(
                width: 180,
                child: AnimatedBuilder(
                  animation: _animationTextRotate,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animationTextRotate.value,
                      child: Text(
                        'GİRİŞ YAP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _isSignUp ? 21.0 : 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom: _isSignUp
                ? MediaQuery.of(context).size.height * 0.1
                : MediaQuery.of(context).size.height * 0.45,
            right:
                _isSignUp ? MediaQuery.of(context).size.width * 0.45 - 90 : -70,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSignUp = !_isSignUp;
                  if (_isSignUp) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                });
              },
              child: SizedBox(
                width: 180,
                child: AnimatedBuilder(
                  animation: _animationTextRotate,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animationTextRotate.value - pi / 2,
                      child: Text(
                        'KAYIT OL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _isSignUp ? 24.0 : 21.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
