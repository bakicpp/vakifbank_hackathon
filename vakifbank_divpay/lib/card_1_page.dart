import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vakifbank_divpay/add_expense.dart';
import 'package:vakifbank_divpay/add_member_page.dart';
import 'package:vakifbank_divpay/colors.dart';
import 'package:vakifbank_divpay/main.dart';
import 'package:vakifbank_divpay/my_cards_page.dart';
import 'package:vakifbank_divpay/no_card_page.dart';

import 'customize_card_page.dart';

class Card1Page extends StatefulWidget {
  const Card1Page({super.key});

  @override
  State<Card1Page> createState() => _Card1PageState();
}

List<String> uye = [
  "YÜKSEL BAKİ YUMAK",
];

List<String> uyeIBAN = [
  "TR09 0004 6001 6088 8000 1946 12",
];

final int uyeSayisi = uye.length;

double yuzdeHesapla = 100 / uyeSayisi;

String yuzde = yuzdeHesapla.toStringAsFixed(1);

class _Card1PageState extends State<Card1Page> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          "Grup Kartlarım",
          style: GoogleFonts.inter(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCardsPage()),
              );
            });
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pageWidth / 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 40),
                child: card(pageWidth, pageHeight),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 30),
                child: uyeHead(pageWidth, pageHeight),
              ),
              SizedBox(
                height: pageHeight / 3,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: uye.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Divider(
                          thickness: 1,
                        ),
                        user(uye[index], uyeIBAN[index], context, pageWidth,
                            pageHeight, index),
                      ],
                    );
                  },
                ),
              ),
              //testButton1(context, pageHeight, pageWidth),
              //testButton2(context, pageHeight, pageWidth),
              addExpenseButton(context, pageWidth, pageHeight),
              //addMemberButton(pageWidth, pageHeight),
              Row(
                children: [
                  esitBolButton(context, pageHeight, pageWidth),
                  SizedBox(
                    width: pageWidth / 50,
                  ),
                  ozelBolButton(context, pageHeight, pageWidth)
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  ElevatedButton ozelBolButton(
      BuildContext context, double pageHeight, double pageWidth) {
    return ElevatedButton(
      onPressed: () {
        onayPopUp2(context, pageHeight, pageWidth);
      },
      child: Text(
        "ÖZEL BÖL",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth / 2.31, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  ElevatedButton esitBolButton(
      BuildContext context, double pageHeight, double pageWidth) {
    return ElevatedButton(
      onPressed: () {
        onaypopUp(context, pageHeight, pageWidth);
      },
      child: Text(
        "EŞİT BÖL",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth / 2.31, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  ElevatedButton testButton2(
      BuildContext context, double pageHeight, double pageWidth) {
    return ElevatedButton(
        onPressed: () {
          onayPopUp2(context, pageHeight, pageWidth);
        },
        child: Text("Test Button 2"));
  }

  ElevatedButton testButton1(
      BuildContext context, double pageHeight, double pageWidth) {
    return ElevatedButton(
        onPressed: () {
          onaypopUp(context, pageHeight, pageWidth);
        },
        child: Text("Test Button"));
  }

  Future<dynamic> onayPopUp2(
      BuildContext context, double pageHeight, double pageWidth) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.white,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: pageHeight / 50,
              ),
              Image.asset(
                "images/warning_icon.png",
                scale: 4,
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Text(
                "ÖDEME ONAYI",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff666666)),
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Text(
                "$harcama TL tutarlı divPay Grup Kart yemek harcamanız için ödemeniz gereken tutarı girerek ödemeyi onaylayabilirsiniz.",
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff666666)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              SizedBox(
                width: pageWidth / 1.47,
                height: pageHeight / 15,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "Ödenecek Tutar",
                  ),
                ),
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: pageWidth / 30,
                  ),
                  MaterialButton(
                      child: Text(
                        "ONAYLA",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minWidth: pageWidth / 1.45,
                      height: pageHeight / 20,
                      color: mainColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Card1Page()),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: pageHeight / 50,
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> onaypopUp(
      BuildContext context, double pageHeight, double pageWidth) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: Colors.white,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/warning_icon.png",
                scale: 4,
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Text(
                "ÖDEME ONAYI",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff666666)),
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Text(
                "divPay Grup Kartı’nız için harcanan " +
                    (harcama / uye.length).toStringAsFixed(2) +
                    " TL" "tutarlı yemek harcamasını onaylıyor musunuz?",
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff666666)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: pageWidth / 40,
                  ),
                  MaterialButton(
                      child: Text(
                        "EVET",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minWidth: pageWidth / 3,
                      height: pageHeight / 20,
                      color: mainColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Card1Page()),
                        );
                      }),
                  SizedBox(
                    width: pageWidth / 30,
                  ),
                  MaterialButton(
                      child: Text(
                        "HAYIR",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minWidth: pageWidth / 3,
                      height: pageHeight / 20,
                      color: mainColor,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton addExpenseButton(
      BuildContext context, double pageWidth, double pageHeight) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddExpense()),
        );
      },
      child: Text(
        "HARCAMA SEÇ",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  ElevatedButton addMemberButton(double pageWidth, double pageHeight) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddMember()),
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

  Row user(String name, String iban, BuildContext context, double pageWidth,
      double pageHeight, int index) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
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
                  iban,
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
            child: name == uye[0]
                ? Image.asset(
                    "images/tac.png",
                    scale: 7,
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            backgroundColor: Colors.white,
                            title: Text("Kullanıcıyı Kaldır"),
                            content: Text(
                                "Kullanıcıyı bir sonraki işlem için kaldırmak istediğinize emin misiniz?"),
                            actions: [
                              MaterialButton(
                                  child: Text(
                                    "EVET",
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
                                    uye.removeAt(index);
                                    uyeIBAN.removeAt(index);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Card1Page()),
                                    );
                                  }),
                              MaterialButton(
                                  child: Text(
                                    "HAYIR",
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
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        );
                      },
                      child: Image.asset(
                        "images/remove-user.png",
                        scale: 30,
                      ),
                    ),
                  )),
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
        CircleAvatar(
          backgroundColor: mainColor,
          radius: 14,
          child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddMember()),
                );
              },
              icon: Icon(
                CupertinoIcons.person_add,
                size: 14,
                color: Colors.white,
              )),
        ),
        SizedBox(
          width: pageWidth / 50,
        ),
        Container(
          width: pageWidth / 8,
          height: pageHeight / 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: mainColor),
          child: Center(
              child: Text(
            "%" + (100 / uye.length).toStringAsFixed(1),
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
            uye.length.toString() + "/10",
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
        mastercard(pageWidth)
      ]),
    );
  }

  Row cardHead() {
    return Row(
      children: [
        Text(
          defKartAdi1,
          style: GoogleFonts.inter(
              color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              card1 = true;
            });

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

  Row mastercard(double pageWidth) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: pageWidth / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.people,
                    color: Colors.white60,
                  ),
                  SizedBox(
                    width: pageWidth / 50,
                  ),
                  Text(
                    harcama.toString() + " TL",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 16,
                    color: Colors.white60,
                  ),
                  SizedBox(
                    width: pageWidth / 23,
                  ),
                  Text(
                    (harcama / uye.length).toStringAsFixed(2) + " TL",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
