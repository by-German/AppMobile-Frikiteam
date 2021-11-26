import 'dart:convert';

import 'package:frikiteam/models/users/customer.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/services/users/user_auth_service.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  Future<Customer> getCustomerById(int id) async {
    var response = await http.get(Uri.parse('$basePath/customers/$id'));
    return Customer.fromJson(jsonDecode(response.body));
  }

  Future<bool> createCustomer({required String firstName, required String lastName, required String email, required String password}) async {
    UserAuthService userAuthService = UserAuthService();
    Customer customer = Customer(id: 0, firstName: firstName, lastName: lastName, email: email, password: password, logo: "default", dateBirth: "2021-11-26T03:16:17.770Z");

    var response = await http.post(
      Uri.parse('$basePath/customers'),
      body: jsonEncode(customer),
      headers: {"Content-Type": "application/json"}
    );

    final user = Customer.fromJson(jsonDecode(response.body));
    return await userAuthService.auth(user.email, user.password);
  }

  Future<Customer> updateCustomer({required int id, required String firstName, required String lastName, required String email, required String password}) async {
    Customer customer = Customer(id: 0, firstName: firstName, lastName: lastName, email: email, password: password, logo: "default", dateBirth: "2021-11-26T03:16:17.770Z");

    var response = await http.put(
      Uri.parse('$basePath/customers/$id'),
      body: jsonEncode(customer),
      headers: {"Content-Type": "application/json"}
    );

    return Customer.fromJson(jsonDecode(response.body));
  }

}