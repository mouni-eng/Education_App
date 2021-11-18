import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/services_model.dart';
import 'package:movies_app/view_models/Services_cubit/cubit.dart';
import 'package:movies_app/view_models/payment_cubit/states.dart';
import 'package:movies_app/views/teacher_layout_views/transaction_view.dart';
import 'package:movies_app/widgets.dart';
import 'package:myfatoorah_flutter/model/initsession/SDKInitSessionResponse.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentStates());

  static PaymentCubit get(context) => BlocProvider.of(context);

  final String mAPIKey = "z29OAb8bOx9w3XY3iwsO27dEVf7XoBB2RraVcIoLwhk5Ngd98A3ZMSeB4IB7_iH-ZfLMnsd3hFOTWb5uUmry39mzMCIH_CnHF0uhjwVRPUEuCMPbbJK81XCOqNiseqf8wBwi0gZB6h_FrEcr1w-6Q5qy-bbluv55Y-YUGGXk8YcZkgRnVA7MRMLXyve6U6JbzEQuGqcnIiNxh2-NzDpcJtBQ2av8Rx612iFe3rkQ27Nq7sEoVH4UbZMHtuvBqxTLibNNpTmTQRXXvWgKPDerYVv29QRakdeAymGl5eDk2Z9OINPROQrZ_2eBzDtprJlobEdEWqBLx73YyHZw2eWt1TWSzE3SYR1Te6rSNGRQtUJvx7aQ5p0WSFxmCFdDPdaHzJnIz38LVnypi_C1FH73yOZ1AbwEJ-34wrB-CHnzykFBXMD7bHht9mpqTSxYz5DtTglWqKRY1Ce5U5RbEdJWatD99UmQM4ONJalYOgjbe9yTItXBxTnNb8BBNJsiChCdVcdIOVSh7m-0E58fPYijWia-6IPxCqtim6zqXYUyB-VE4WmtJKP0XBqJoMZBTnVMwH2mps7tvM6grkBSZqCqvOYXleueOkA3R4i64cKL48R94rVYQuntUwi0M8wtAzzIWaqNGYSrSqrDAX3VKCQYAUeXJnjOaGU08NDtpVhYpXyixiFw5wvfWb5lC1Xu2b-DVE6-pQ";

  void initPayment() {
    MFSDK.init(MFBaseURL.TEST, mAPIKey);
    initiateSession();
    MFSDK.setUpAppBar(isShowAppBar: true);
  }

  void initiateSession() {
    emit(PaymentInitiateSessionLoading());
    MFSDK.initiateSession((MFResult<MFInitiateSessionResponse> result) =>
    {
      if(result.isSuccess()) {
        emit(PaymentInitiateSessionSuccess())
      }
      else
        {
          emit(PaymentInitiateSessionError())
        }
    });
  }



  void executeRegularPayment(context, int id, ServicesModel model) {
    // The value 1 is the paymentMethodId of KNET payment method.
    // You should call the "initiatePayment" API to can get this id and the ids of all other payment methods
    var request = new MFExecutePaymentRequest(id, 1.00);
    emit(PaymentExecuteLoading());
    MFSDK.executePayment(
        context,
        request,
        MFAPILanguage.EN,
            (String invoiceId, MFResult<MFPaymentStatusResponse> result) => {
          if (result.isSuccess())
            {
              handleSuccessResponse(context, model, result.response!.invoiceId.toString())
            }
          else
            {
              handleSuccessResponse(context, model, result.response!.invoiceId.toString())
            }
        });
  }

  void handleSuccessResponse(context, ServicesModel model, String sessionId) {
    ServicesCubit.get(context).uploadService(model);
    navigateTo(context, TransactionView(status: "Success", sessionId: sessionId, image: "assets/images/Success.svg"));
    emit(PaymentExecuteSuccess());
  }

  void handleErrorResponse(context, ServicesModel model, String sessionId) {
    navigateTo(context, TransactionView(status: "Error", sessionId: sessionId, image: "assets/images/Error.svg"));
    emit(PaymentExecuteError());
  }

}