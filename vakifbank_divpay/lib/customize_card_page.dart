import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vakifbank_divpay/card_1_page.dart';
import 'package:vakifbank_divpay/colors.dart';
import 'package:vakifbank_divpay/create_card.dart';
import 'package:vakifbank_divpay/no_card_page.dart';

class CustomizeCard extends StatefulWidget {
  const CustomizeCard({super.key});

  @override
  State<CustomizeCard> createState() => _CustomizeCardState();
}

TextEditingController kartAdi = TextEditingController();

class _CustomizeCardState extends State<CustomizeCard> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          "Özelleştir",
          style: GoogleFonts.inter(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
        leading: backButton(context),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pageWidth / 18),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 40),
                child: card(pageWidth, pageHeight),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 20),
                child: renkText(),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 50),
                child: Container(
                  width: pageWidth,
                  height: pageHeight / 15,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (turuncu == true) {
                            setState(() {
                              turuncu = false;
                            });
                          } else {
                            setState(() {
                              yesil = false;
                              turuncu = true;
                            });
                          }
                        },
                        child: CircleAvatar(
                          radius: 13.8,
                          backgroundColor: Colors.orange,
                        ),
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (yesil == true) {
                            setState(() {
                              yesil = false;
                            });
                          } else {
                            setState(() {
                              turuncu = false;
                              yesil = true;
                            });
                          }
                        },
                        child: CircleAvatar(
                          radius: 13.8,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      CircleAvatar(
                        radius: 13.8,
                        backgroundColor: Colors.redAccent,
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      CircleAvatar(
                        radius: 13.8,
                        backgroundColor: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      CircleAvatar(
                        radius: 13.8,
                        backgroundColor: Colors.purple,
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      CircleAvatar(
                        radius: 13.8,
                        backgroundColor: Colors.yellow,
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      CircleAvatar(
                        radius: 13.8,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      CircleAvatar(
                        radius: 13.8,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      CircleAvatar(
                        radius: 13.8,
                        backgroundColor: Colors.pink,
                      ),
                      SizedBox(
                        width: pageWidth / 50,
                      ),
                      CircleAvatar(
                        radius: 13.8,
                        backgroundColor: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 20),
                child: saveButton(pageWidth, pageHeight),
              )
            ],
          ),
        ),
      )),
    );
  }

  Text renkText() {
    return Text(
      "Renk Seçimi",
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xffB3ACB8)),
    );
  }

  TextField ibanTf() {
    return TextField(
      style: GoogleFonts.inter(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white60),
      controller: kartAdi,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white60,
                  style: BorderStyle.solid,
                  strokeAlign: StrokeAlign.inside)),
          hintText: defKartAdi2,
          hintStyle: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white60)),
    );
  }

  IconButton backButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
      onPressed: () {
        if (card1 == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Card1Page()),
          );
        }
      },
    );
  }

  ElevatedButton saveButton(double pageWidth, double pageHeight) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          defKartAdi1 = kartAdi.text;
          defKartAdi2 = kartAdi.text;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomizeCard()),
        );
      },
      child: Text(
        "KAYDET",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  Container card(double pageWidth, double pageHeight) {
    return Container(
      width: pageWidth,
      height: pageHeight / 4,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: gray,
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.circular(8),
          gradient: yesil
              ? yesilGrad
              : turuncu
                  ? turuncuGrad
                  : basicGrad),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: cardHead(),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 20.0,
            left: 20,
          ),
          child: isimTxt(),
        ),
        Spacer(),
        mastercard()
      ]),
    );
  }

  Row cardHead() {
    return Row(
      children: [
        SizedBox(width: 150, child: ibanTf()),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomizeCard()),
            );
          },
          child: Image.asset(
            "images/customize.png",
            scale: 16,
          ),
        )
      ],
    );
  }

  Row isimTxt() {
    return Row(
      children: [
        Text(
          "YÜKSEL BAKİ YUMAK",
          style: GoogleFonts.inter(
              color: Colors.white60, fontSize: 10, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Row mastercard() {
    return Row(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            "images/mc.png",
            scale: 30,
          ),
        ),
      ],
    );
  }
}
