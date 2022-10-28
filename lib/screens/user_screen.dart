import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:udemy_flutter/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressController =
      TextEditingController(text: 'Someplace');

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                    text: 'Hi, ',
                    style: TextStyle(
                      color: color,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Abhy',
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint(
                                'UserScreen TapGestureRecognizer..onTap - my name was pressed');
                          },
                      )
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'myemail@email.com',
                color: color,
                textSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTiles(
                title: 'Address',
                leadingIcon: IconlyLight.activity,
                onPressed: () async {
                  await _showAddressDialog();
                },
                color: color,
              ),
              _listTiles(
                title: 'Orders',
                leadingIcon: IconlyLight.bag,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Wishlist',
                leadingIcon: IconlyLight.heart,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Viewed',
                leadingIcon: IconlyLight.show,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Forgot Password',
                leadingIcon: IconlyLight.unlock,
                onPressed: () {},
                color: color,
              ),
              SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                    color: color,
                    textSize: 24,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    // debugPrint('onChanged triggered: $value');
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme),
              _listTiles(
                title: 'Logout',
                leadingIcon: IconlyLight.logout,
                onPressed: () {
                  _showLogoutDialog();
                },
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Row(children: [
                Image.asset('assets/images/warning-sign.png',
                    height: 20, width: 20, fit: BoxFit.fill),
                const SizedBox(
                  width: 8,
                ),
                const Text('Sign out'),
              ]),
              content: const Text('Do you want to sign out?'),
              actions: [
                TextButton(
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: TextWidget(
                      color: Colors.cyan,
                      text: 'Cancel',
                      textSize: 18,
                    )),
                TextButton(
                    onPressed: () {},
                    child: TextWidget(
                      color: Colors.red,
                      text: 'OK',
                      textSize: 18,
                    )),
              ]);
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update'),
          content: TextField(
            controller: _addressController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Your address"),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Update'),
            )
          ],
        );
      },
    );
  }

  Widget _listTiles(
      {required String title,
      // String? subTitle,
      required IconData leadingIcon,
      required Function onPressed,
      required Color color}) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 24,
      ),
      // subtitle: TextWidget(
      //   text: subTitle ?? '',
      //   color: color,
      //   textSize: 18,
      // ),
      leading: Icon(leadingIcon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
