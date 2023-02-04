import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vakifbank_divpay/card_1_page.dart';
import 'package:vakifbank_divpay/colors.dart';
import 'package:vakifbank_divpay/create_card.dart';
import 'package:vakifbank_divpay/no_card_page.dart';

import 'customize_card_page.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

TextEditingController ibanContr = TextEditingController();
TextEditingController adSoyadCont = TextEditingController();

class _AddMemberState extends State<AddMember> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          "Üye Ekle",
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
            children: [
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 40),
                child: card(pageWidth, pageHeight),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 30),
                child: ibanTf(),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 30),
                child: adSoyadTf(),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 20),
                child: addMemberButton(pageWidth, pageHeight),
              )
            ],
          ),
        ),
      )),
    );
  }

  TextField adSoyadTf() {
    return TextField(
      controller: adSoyadCont,
      decoration: InputDecoration(
          hintText: "Ad Soyad",
          hintStyle: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffB3ACB8))),
    );
  }

  TextField ibanTf() {
    return TextField(
      controller: ibanContr,
      decoration: InputDecoration(
          suffixIcon: Icon(
            CupertinoIcons.camera,
            size: 20,
            color: mainColor,
          ),
          hintText: "IBAN",
          hintStyle: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffB3ACB8))),
    );
  }

  IconButton backButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );
  }

  ElevatedButton addMemberButton(double pageWidth, double pageHeight) {
    return ElevatedButton(
      onPressed: () {
        uye.add(adSoyadCont.text);
        uyeIBAN.add(ibanContr.text);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            backgroundColor: Colors.white,
            title: Text("Kullanıcı Ekle"),
            content: Text("Kullanıcıyı başarıyla eklendi."),
            actions: [
              MaterialButton(
                  child: Text(
                    "TAMAM",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  minWidth: pageWidth / 2.8,
                  height: pageHeight / 20,
                  color: mainColor,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Card1Page()),
                      );
                    });
                  }),
            ],
          ),
        );
      },
      child: Text(
        "ÜYE EKLE",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  Row user() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "YÜKSEL BAKİ YUMAK",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xff666666)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "TR09 0004 6001 6088 8000 1946 12",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xff666666)),
                ),
              ],
            )
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "images/tac.png",
            scale: 7,
          ),
        ),
      ],
    );
  }

  Row uyeHead(double pageWidth, double pageHeight) {
    return Row(
      children: [
        Text(
          "Grup Kart Üyeleri",
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xffB3ACB8)),
        ),
        Spacer(),
        Container(
          width: pageWidth / 10,
          height: pageHeight / 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: mainColor),
          child: Center(
              child: Text(
            "%100",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
          )),
        ),
        SizedBox(
          width: pageWidth / 50,
        ),
        Container(
          width: pageWidth / 10,
          height: pageHeight / 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: mainColor),
          child: Center(
              child: Text(
            "1/10",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
          )),
        )
      ],
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
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: cardHead(),
        ),
        Padding(
          padding: const EdgeInsets.only(
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
        Text(
          defKartAdi2,
          style: GoogleFonts.inter(
              color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
        ),
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
