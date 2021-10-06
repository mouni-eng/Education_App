import 'package:flutter/material.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/services/network/payment_helper.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FloatingActionButton(
          child: Icon(IconBroken.Download),
          onPressed: () async{
            CheckOut checkOut = CheckOut();
            await checkOut.makePayment();
          },
        ),
      ),
    );
  }
}
