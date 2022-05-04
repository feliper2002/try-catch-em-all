import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

showToast(BuildContext context, String message, {int? duration}) {
  ToastContext().init(context);
  Toast.show(message, duration: duration);
}
