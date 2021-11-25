import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentService {
  Storage storage = Storage();

  Future<bool> createPayment({required String description, required double amount, required String email, required int eventId}) async {
    final user = await storage.getUserAuth();
    Payment payment = Payment(
      description: description,
      amount: amount * 100, 
      currency: 'pen', 
      customerId: user.id, 
      eventId: eventId, 
      email: email
    );
    
    final response = await http.post(
      Uri.parse('$basePath/payments'),
      body: jsonEncode(payment),
      headers: {"Content-Type": "application/json"}
    );

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return await _confirmPayment(res['id']);
    }
    return false;
  }

  Future<bool> _confirmPayment(String paymentId) async {
    var response = await http.get(
      Uri.parse('$basePath/payments/$paymentId'),
      headers: {"Content-Type": "application/json"}
    );
    return response.statusCode == 200;
  }

}

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    required this.description,
    required this.amount,
    required this.currency,
    required this.customerId,
    required this.eventId,
    required this.email,
  });

  String description;
  double amount;
  String currency;
  int customerId;
  int eventId;
  String email;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
      description: json["description"],
      amount: json["amount"],
      currency: json["currency"],
      customerId: json["customerId"],
      eventId: json["eventId"],
      email: json["email"],
  );

  Map<String, dynamic> toJson() => {
      "description": description,
      "amount": amount,
      "currency": currency,
      "customerId": customerId,
      "eventId": eventId,
      "email": email,
  };
}
