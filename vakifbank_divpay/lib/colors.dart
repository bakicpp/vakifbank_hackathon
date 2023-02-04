import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color mainColor = Color(0xffFCBB02);
Color gray = Color(0xffF9F8FB);
Color textGray = Color(0xffB3ACB8);

final yesilGrad = LinearGradient(
  colors: [
    Colors.green,
    Colors.greenAccent,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final turuncuGrad = LinearGradient(
  colors: [
    Colors.orange,
    Colors.amber,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final basicGrad = LinearGradient(colors: [
  Color(0xff717171),
  Color(0xffC2C2C2),
], begin: Alignment.topCenter, end: Alignment.bottomCenter);

String defKartAdi2 = "Grup Kartın";
String defKartAdi1 = "Grup Kartın";

bool yesil = false;
bool turuncu = false;

double harcama = 0;

bool harcamaGoster = false;

bool card1 = false;
