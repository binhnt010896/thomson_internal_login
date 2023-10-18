import 'package:flutter/material.dart';
import 'package:thomson_internal_login/utilities/text_styles.dart';
import 'package:thomson_internal_login/utilities/theme_data.dart';

enum ButtonType {
  primary,
  white,
  text,
  link
}

class ButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final dynamic title;
  final ButtonType type;
  final bool fullWidth;
  final double height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? textPadding;
  final EdgeInsetsGeometry? padding;
  final VisualDensity? visualDensity;
  final bool isLoading;
  final bool enabled;
  final double? elevation;
  final double? borderRadius;
  final Widget? leading;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.type = ButtonType.primary,
    this.fullWidth = true,
    this.height = 48,
    this.textStyle,
    this.backgroundColor,
    this.textPadding,
    this.padding,
    this.visualDensity,
    this.isLoading = false,
    this.enabled = true,
    this.elevation = 0,
    this.borderRadius,
    this.leading,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  _renderButton() {
    double borderRadius = widget.borderRadius ?? 50;
    TextStyle textStyle = widget.textStyle ?? TextStyles.buttonM;
    EdgeInsetsGeometry? textPadding = widget.textPadding;

    switch (widget.type) {
      case ButtonType.primary:
        textPadding = textPadding ?? EdgeInsets.only(bottom: 4);
        break;
      case ButtonType.white:
        textPadding = textPadding ?? EdgeInsets.only(bottom: 4);
        break;
      case ButtonType.text:
        break;
      case ButtonType.link:
        break;
    }

    if (widget.type == ButtonType.link) {
      return InkWell(
        onTap: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.leading ?? Container(),
            Text(widget.title),
          ],
        ),
      );
    }

    return Container(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 22),
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFB852CD), Color(0xFF8659B2)]),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: widget.enabled ? widget.onPressed : null,
        hoverColor: Colors.transparent,
        child: Center(
            child: widget.isLoading ? SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: themeColor.fillBgWhite,
              ),
            ) : Padding(
              padding: textPadding ?? EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.leading ?? Container(),
                  Builder(
                    builder: (context) {
                      if (widget.title is String) {
                        return Text(
                          widget.title,
                          style: textStyle.copyWith(color: themeColor.onPrimary),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        );
                      }
                      if (widget.title is Widget) {
                        return widget.title;
                      }
                      return Container();
                    },
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fullWidth) return _renderButton();

    return Row(
      children: <Widget>[
        Expanded(flex: 1, child: Container()),
        _renderButton(),
        Expanded(flex: 1, child: Container()),
      ],
    );
  }
}
