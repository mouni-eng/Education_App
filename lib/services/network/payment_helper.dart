import 'dart:convert';
import 'package:http/http.dart' as http;

class CheckOut {

  static const _tokenUrl = "https://api.tap.company/v2/token";
  static const _chargeUrl = "https://api.tap.company/v2/charges";
  static const _retriveChargeUrl = "https://api.tap.company/v2/charges/chg_TS065520211229Kq2w3009293";
  static const _paymentKey = "Bearer sk_test_XKokBfNWv6FIYuTMg5sLPjhJ";

  Map<String, String> headers = {
    'Authorization' : _paymentKey,
    'Content-Type' : 'application/json'
  };

  var tokenBody = jsonEncode({
    "card": {
      "number": 5123450000000008,
      "exp_month": 7,
      "exp_year": 2022,
      "cvc": 100,
      "name": "test user",
      "address": {
        "country": "Kuwait",
        "line1": "Salmiya, 21",
        "city": "Kuwait city",
        "street": "Salim",
        "avenue": "Gulf"
      }
    },
    "client_ip": "192.168.1.20"
  });

  var chargeBody = jsonEncode({
    "amount": 1,
    "currency": "KWD",
    "customer": {
      "first_name": "test",
      "middle_name": "test",
      "last_name": "test",
      "email": "test@test.com",
      "phone": {
        "country_code": "965",
        "number": "50000000"
      }
    },
    "source": {
      "id": "tok_TuLb121929O5Zr30WT8o768"
    },
    "redirect": {
      "url": "http://your_website.com/redirect_url"
    }
  });

  Future<String> getToken() async{
    http.Response response = await http.post(Uri.parse(_tokenUrl), headers: headers, body: tokenBody);
    print(response.body);
    return response.body;
  }

  Future<String> makePayment() async{
    http.Response response = await http.post(Uri.parse(_chargeUrl), headers: headers, body: chargeBody);
    print(response.body);
    return response.body;
  }

  Future<String> getCharge() async{
    http.Response response = await http.get(Uri.parse(_retriveChargeUrl), headers: headers,);
    print(response.body);
    return response.body;
  }

}

// tok_TuLb121929O5Zr30WT8o768

// chg_TS065520211229Kq2w3009293