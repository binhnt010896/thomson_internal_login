import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thomson_internal_login/utilities/consts.dart';
import 'package:thomson_internal_login/utilities/theme_data.dart';

extension DateTimeHelper on DateTime {
  String get ymdhm {
    return DateFormat('yyyy/MM/dd HH:mm', 'en-Sg').format(this);
  }
}

extension ContextHelper on BuildContext {
  bool get isMobile {
    return (mediaQuerySize.width < MAX_MOBILE_WIDTH);
  }
}

/// Toast
enum ToastType {
  error,
  success,
  info
}

showToast(String content, ToastType type) {
  Color textColor = themeColor.onPrimary;
  Color bgColor = themeColor.primary;
  switch(type) {
    case ToastType.success:
      bgColor = themeColor.successMain;
      break;
    case ToastType.error:
      bgColor = themeColor.errorMain;
      break;
    default:
  }
  Fluttertoast.showToast(
      msg: content,
      backgroundColor: bgColor,
      webPosition: 'center',
      webBgColor: '#${bgColor.value.toRadixString(16).substring(2)}',
      textColor: textColor,
      timeInSecForIosWeb: 3
  );
}