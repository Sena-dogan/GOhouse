import 'package:flutter/material.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppThemeData.lightThemeData.primaryColor.withOpacity(0.4),
        ),
        child: Icon(
          icon,
          color: MenuColors.midnightGreenEagleGreen,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
            fontSize: 17, fontWeight: FontWeight.bold, color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppThemeData.lightThemeData.primaryColor,
                size: 18.0,
              ),
            )
          : null,
    );
  }
}