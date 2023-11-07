import 'package:ecommerce_app_with_firebase/constants/routes.dart';
import 'package:ecommerce_app_with_firebase/custom_widgets/cupertino_alert_dialog.dart';
import 'package:ecommerce_app_with_firebase/provider/auth_provider.dart';
import 'package:ecommerce_app_with_firebase/views/auth_view/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import 'drawer_tile.dart';
import 'header_container.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderContainer(
                onTap: () {
                  Navigator.of(context).pop();
                },
                icon: Icons.menu_open,
              ),
              SizedBox(height: s.height * 0.017),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  radius: 21,
                  backgroundColor: unselectedRadioColor,
                  backgroundImage: NetworkImage(
                      'https://pngimg.com/uploads/dress_shirt/dress_shirt_PNG8115.png'),
                ),
                title: Text(
                  'Aizaz Alam Khan'.substring(0, 14),
                  style: const TextStyle(
                    fontSize: 17,
                    color: customBlackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Row(
                  children: [
                    Text(
                      'Verified Profile',
                      style: TextStyle(
                        fontSize: 13,
                        color: lightGreyColor,
                      ),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      color: greenColor,
                      size: 14,
                    ),
                  ],
                ),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: unselectedRadioColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    '3 Orders',
                    style: TextStyle(
                      fontSize: 11,
                      color: lightGreyColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: s.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DrawerTile(
                    s: s,
                    title: 'Dark Mode',
                    icon: Icons.light_mode_outlined,
                    onTap: () {},
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: darkMode,
                      onChanged: (value) {
                        setState(() {
                          darkMode = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              DrawerTile(
                s: s,
                title: 'Account Information',
                icon: Icons.info_outline_rounded,
                onTap: () {},
              ),
              DrawerTile(
                s: s,
                title: 'Password',
                icon: Icons.lock_outline,
                onTap: () {},
              ),
              DrawerTile(
                s: s,
                title: 'Order',
                icon: Icons.shopping_bag_outlined,
                onTap: () {},
              ),
              DrawerTile(
                s: s,
                title: 'My Cards',
                icon: Icons.credit_card,
                onTap: () {},
              ),
              DrawerTile(
                s: s,
                title: 'Wishlist',
                icon: CupertinoIcons.square_favorites_alt,
                onTap: () {},
              ),
              DrawerTile(
                s: s,
                title: 'Settings',
                icon: CupertinoIcons.settings,
                onTap: () {},
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  authProvider
                      .signOut()
                      .then(
                        (value) => nextPageRemovePrevious(
                          context,
                          rootNavigator: true,
                          const SignInScreen(),
                        ),
                      )
                      .catchError(
                        (error, stackTrace) => showCupertinoDialog(
                          context: context,
                          builder: (context) => buildCupertinoAlertDialog(
                            s: s,
                            context: context,
                            title: 'Account Info',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            content: 'Failed to Log out!',
                            buttonTitle: 'Go Back',
                            icon: Icons.person_pin_outlined,
                          ),
                        ),
                      );
                },
                child: Row(
                  children: [
                    const Icon(Icons.logout_sharp, color: redColor, size: 25),
                    SizedBox(width: s.width * 0.02),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 15,
                        color: redColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: s.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
