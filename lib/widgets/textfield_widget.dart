import 'package:gohouse/constants/app_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        child: TextFormField(
          controller: textController,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          autofocus: autoFocus,
          textInputAction: inputAction,
          obscureText: this.isObscure,
          maxLength: 25,
          keyboardType: this.inputType,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
              enabledBorder: new OutlineInputBorder(borderSide: new BorderSide(color: AppThemeData.lightColorScheme.primary)),
              hintText: this.hint,
              hintStyle: TextStyle(color: hintColor),
              errorText: errorText,
              counterText: '',
              icon: this.isIcon ? Icon(this.icon, color: iconColor) : null),
        ),
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.black,
    this.iconColor = Colors.white,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);

}
