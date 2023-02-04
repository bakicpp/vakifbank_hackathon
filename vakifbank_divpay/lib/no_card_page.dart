import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vakifbank_divpay/card_create_loading_page.dart';
import 'package:vakifbank_divpay/colors.dart';
import 'package:vakifbank_divpay/create_card.dart';

class NoCardPage extends StatefulWidget {
  const NoCardPage({super.key});

  @override
  State<NoCardPage> createState() => _NoCardPageState();
}

class _NoCardPageState extends State<NoCardPage> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            "Grup Kartlarım",
            style: GoogleFonts.inter(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: true,
          leading: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pageWidth / 18),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: pageHeight / 3),
                  child: text(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: pageHeight / 3),
                  child: createButton(pageWidth, pageHeight),
                )
              ],
            ),
          ),
        ));
  }

  ElevatedButton createButton(double pageWidth, double pageHeight) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CardCreateLoad()),
        );
      },
      child: Text(
        "GRUP KART OLUŞTUR",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  Text text() {
    return Text(
      "Henüz hiçbir grup kart oluşturmadınız ya da hiçbir grup kart üyeliğiniz bulunumuyor.",
      style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }
}
