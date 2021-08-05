import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/cart_icon.png',
        height: 22,
      ),
    );
  }

  Widget costumBottomNav() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: bgColor4,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Image.asset(
                  'assets/home_icon.png',
                  width: 21,
                  color: currentIndex == 0
                      ? primaryColor
                      : const Color(0xff808191),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Image.asset(
                  'assets/chat_icon.png',
                  width: 21,
                  color: currentIndex == 1
                      ? primaryColor
                      : const Color(0xff808191),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Image.asset(
                  'assets/fav_icon.png',
                  width: 20,
                  color: currentIndex == 2
                      ? primaryColor
                      : const Color(0xff808191),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Image.asset(
                  'assets/profile_icon.png',
                  width: 18,
                  color: currentIndex == 3
                      ? primaryColor
                      : const Color(0xff808191),
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
        break;
      case 1:
        return const ChatPage();
        break;
      case 2:
        return const WishlistPage();
        break;
      case 3:
        return const ProfilePage();
        break;
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: costumBottomNav(),
      body: body(),
    );
  }
}
