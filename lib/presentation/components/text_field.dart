import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String? leadingIconPath;
  final bool obscureText;
  final TextEditingController controller;
  final String? errorText;
  final String? labelText;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
    this.leadingIconPath,
    this.obscureText = false,
    this.errorText,
    this.labelText,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _hasText = false;
  late bool _isObscured = widget.obscureText;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateTextStatus);
    _updateTextStatus();
    _isObscured = widget.obscureText;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateTextStatus);
    super.dispose();
  }

  void _updateTextStatus() {
    final hasText = widget.controller.text.isNotEmpty;
    if (_hasText != hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.colorsOf(context);
    final dimens = AppTheme.dimensOf(context);
    final typo = AppTheme.textThemeOf(context);

    final padding = dimens.small + dimens.extraSmall;

    final dynamicIconColor = _hasText ? colors.primary : colors.outline;
    final dynamicHintColor = _hasText ? colors.onSurface : colors.outline;

    Widget? prefixWidget;
    if (widget.leadingIconPath != null) {
      prefixWidget = Padding(
        padding: EdgeInsets.only(left: padding, top: padding, bottom: padding),
        child: SvgPicture.asset(
          widget.leadingIconPath!,
          height: padding,
          width: padding,
          colorFilter: ColorFilter.mode(dynamicIconColor, BlendMode.srcIn),
        ),
      );
    }

    Widget? suffixWidget;
    if (widget.obscureText) {
      suffixWidget = IconButton(
        icon: Icon(
          _isObscured ? Icons.visibility_off : Icons.visibility,
          color: dynamicIconColor,
        ),
        onPressed: _toggleObscureText,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: dimens.small),
            child: Text(
              widget.labelText!,
              style: typo.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

        TextField(
          onTapOutside: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: _isObscured,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.onInverseSurface),
              borderRadius: BorderRadius.circular(dimens.smallMedium),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: dynamicHintColor),
            fillColor: colors.onInverseSurface,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: dimens.small, vertical: dimens.smallMedium),
            prefixIcon: prefixWidget,
            suffixIcon: suffixWidget,
            errorText: widget.errorText,
          ),
        ),
      ],
    );
  }
}