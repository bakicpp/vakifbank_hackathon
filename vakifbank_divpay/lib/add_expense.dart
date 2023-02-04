import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vakifbank_divpay/card_create_loading_page.dart';
import 'package:vakifbank_divpay/colors.dart';
import 'package:vakifbank_divpay/create_card.dart';
import 'package:vakifbank_divpay/main.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 229, 229),
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            "Hesap Hareketleri",
            style: GoogleFonts.inter(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pageWidth / 18),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: pageHeight / 50,
                  ),
                  Container(
                    width: pageWidth,
                    height: pageHeight / 3.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white60),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: pageWidth / 18, left: pageWidth / 18),
                          child: Row(children: [
                            Text(
                              "Vadesiz TL",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: textGray),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: pageWidth / 20),
                              child: Icon(
                                Icons.swap_horiz,
                                color: mainColor,
                              ),
                            )
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: pageWidth / 18, top: pageHeight / 150),
                          child: Row(
                            children: [
                              Text(
                                "TR09 0004 6001 6088 8000 1946 12",
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: textGray),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: pageWidth / 18, top: pageHeight / 100),
                          child: Row(
                            children: [
                              Text(
                                "Bakiye",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: textGray),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: pageWidth / 18),
                                child: Text(
                                  "1.863,23 TL",
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: pageHeight / 50,
                        ),
                        Divider(
                          indent: pageWidth / 20,
                          endIndent: pageWidth / 20,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: pageHeight / 40,
                        ),
                        SizedBox(
                          width: pageWidth / 1.27,
                          child: TextField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.date_range),
                                hintText: "Son 1 Ay",
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(6),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: pageHeight / 50,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: mainColor,
                        size: 17,
                      ),
                      SizedBox(
                        width: pageWidth / 100,
                      ),
                      Text(
                        "Detaylı Ara",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: mainColor),
                      ),
                      Spacer(),
                      Icon(
                        Icons.edit,
                        color: mainColor,
                        size: 17,
                      ),
                      SizedBox(
                        width: pageWidth / 100,
                      ),
                      Text(
                        "Ekste Gönder",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: mainColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: pageHeight / 50,
                  ),
                  Container(
                    width: pageWidth,
                    height: pageHeight / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  harcamaGoster = true;
                                  harcama = 101.45;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: pageWidth,
                                height: pageHeight / 8,
                                // color: Colors.green,
                                child: Padding(
                                  padding: EdgeInsets.all(pageWidth / 18),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "2",
                                                style: GoogleFonts.inter(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "Şubat",
                                                style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: textGray),
                                              ),
                                              Text(
                                                "18:38",
                                                style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: textGray),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: pageWidth / 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "BKM Pos Harcama",
                                                style: GoogleFonts.inter(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: pageHeight / 100,
                                              ),
                                              Text(
                                                "Bakiye: 1.863,27 TL",
                                                style: GoogleFonts.inter(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: textGray),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: pageWidth / 8.7,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
                                                child: Text(
                                                  "-101,45 TL",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              indent: pageWidth / 200,
                              endIndent: pageWidth / 200,
                              thickness: 1,
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
