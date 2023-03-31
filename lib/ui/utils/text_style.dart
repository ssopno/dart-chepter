import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

TextStyle screenTitleTextStyle=  const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black
);
TextStyle screenSubTitleStyle= const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    fontSize: 12
);


PinTheme appOTPStyle(){
  return  PinTheme(
    inactiveColor: Colors.white70,
    inactiveFillColor: Colors.white,
    selectedColor: Colors.green,
    activeColor: Colors.white,
    selectedFillColor: Colors.green,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: Colors.white,
  );
}