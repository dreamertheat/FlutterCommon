import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

void callToast(String message, BuildContext bc){
  Toast.show("${message}", bc, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}