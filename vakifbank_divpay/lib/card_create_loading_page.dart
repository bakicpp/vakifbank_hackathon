import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vakifbank_divpay/colors.dart';
import 'package:vakifbank_divpay/create_card.dart';
import 'package:vakifbank_divpay/main.dart';

class CardCreateLoad extends StatefulWidget {
  const CardCreateLoad({super.key});

  @override
  State<CardCreateLoad> createState() => _CardCreateLoadState();
}

class _CardCreateLoadState extends State<CardCreateLoad> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 750), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateCard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Center(
                child: SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                  duration: Duration(milliseconds: 2400),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text("Grup Kart oluşturuyor..."),
              )
            ],
          )
        ],
      ),
    );
  }
}
