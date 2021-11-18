import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/services_model.dart';
import 'package:movies_app/view_models/payment_cubit/cubit.dart';
import 'package:movies_app/view_models/payment_cubit/states.dart';
import 'package:sizer/sizer.dart';

class PaymentView extends StatelessWidget {
  final ServicesModel servicesModel;

  PaymentView({required this.servicesModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PaymentCubit cubit = PaymentCubit();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Choose your payment",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            child: Column(
              children: [
                Text(
                  "Complete uploading your service for 1.00 KD which will be available for only one week from now",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      cubit.executeRegularPayment(context, 1, servicesModel);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("assets/images/knet.jfif", fit: BoxFit.fill)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      cubit.executeRegularPayment(context, 20, servicesModel);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("assets/images/visa-mastercard.png", fit: BoxFit.fill,)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
