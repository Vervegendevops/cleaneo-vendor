import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../model/user.dart';
import '../services/api_provider.dart';
import '../utils/local_storage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Razorpay ? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
  }

  void openPaymentPortal() async {
    User? user=await LocalStorage().getUser();

    print("am====${amountController.text}");
    var options = {
      'key': 'rzp_live_kJZpBxT80OccTn',

      //'key': 'rzp_live_ciT70AxpLdSZ9B',
      'amount': int.parse(amountController.text),
      'name': user?.name??"",
      'description': 'Payment',
      'prefill': {
        'contact': '${user?.phone}',
      },
      'external': {
        'wallets': [
          'paytm',
        ],
      }
    };

    try {
      _razorpay?.open(options);
      print("Making payment");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print(response.paymentId);
    print('payment');
    print(response.data);
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT: ${response.paymentId}", timeInSecForIosWeb: 4);
   // await ApiProvider().addWallet("${response.paymentId}", amountController.text.toString(), "Money donate successfully", "add to donation", "debit");

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET IS : ${response.walletName}",
        timeInSecForIosWeb: 4);
  }
  final _formKey = GlobalKey<FormState>();

  final amountController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Payment',
            style: TextStyle(fontSize: 22.0, color: Color(0xFF545D68))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(height: 16.0),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Card(
            //       child: Column(
            //         children: <Widget>[
            //           Text(
            //             '20000',
            //             style: TextStyle(
            //                 fontSize: 22.0,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.blue.shade900),
            //           ),
            //           const SizedBox(height: 10.0),
            //           const Text(' Ice Cream',
            //               style: TextStyle(color: Colors.grey, fontSize: 24.0)),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Donation Amount',
                hintText: 'Enter the donation amount',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a donation amount';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Note (Optional)',
                hintText: 'Enter a note or purpose for the donation',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            const SizedBox(height: 18.0),
            InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    openPaymentPortal();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Donation')),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Container(
                      width: MediaQuery.of(context).size.width - 60.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.blue.shade900),
                      child: Center(
                          child: Text('Pay',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blue.shade50)))),
                ))
          ]),
        ),
      ),
    );
  }
}
