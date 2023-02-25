import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SettingButton extends StatefulWidget {
  const SettingButton({super.key});

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Image.asset(
          'assets/images/setting-icon.png',
          fit: BoxFit.contain,
        ),
        openWithLongPress: false,
        customItemsHeights: [
          ...List<double>.filled(MenuItems.firstItems.length, 48),
          8,
          ...List<double>.filled(MenuItems.secondItems.length, 48),
        ],
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        itemHeight: 48,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 160,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFF59843E),
        ),
        dropdownElevation: 8,
        offset: const Offset(4, -4),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [like, share, download];
  static const List<MenuItem> secondItems = [logout];

  static const like = MenuItem(text: 'Like', icon: Icons.favorite);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const download = MenuItem(text: 'Download', icon: Icons.download);
  static const logout = MenuItem(text: 'Logout', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: Colors.white,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.like:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.download:
        //Do something
        break;
      case MenuItems.logout:
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          text: 'Bạn có chắc sẽ thoát',
          confirmBtnText: 'Có',
          cancelBtnText: 'Không',
          confirmBtnColor: Colors.green,
          onConfirmBtnTap: () async {
            await GoogleSignIn().signOut();
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/login_screen');
          },
          onCancelBtnTap: () =>
              {Navigator.of(context, rootNavigator: true).pop(false)},
        );
        break;
    }
  }
}
