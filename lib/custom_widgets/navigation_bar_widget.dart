import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/views/bottom_navigation_screens/notifications_screen.dart';
import 'package:ecommerce_app_with_firebase/views/bottom_navigation_screens/home_screen.dart';
import 'package:ecommerce_app_with_firebase/views/bottom_navigation_screens/profile_screen.dart';
import 'package:ecommerce_app_with_firebase/views/shopping_card_screen.dart';
import 'package:ecommerce_app_with_firebase/views/bottom_navigation_screens/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style1,
      navBarHeight: 60,
      resizeToAvoidBottomInset: true,
    );
  }

  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      const WishListScreen(),
      const NotificationsScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: primaryColor.withOpacity(0.3),
        inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.square_favorites_alt),
        title: ("Wishlist"),
        activeColorPrimary: primaryColor.withOpacity(0.3),
        inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_active_outlined),
        title: ("Cart"),
        activeColorPrimary: primaryColor.withOpacity(0.3),
        inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: primaryColor.withOpacity(0.3),
        inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: primaryColor,
      ),
    ];
  }
}
