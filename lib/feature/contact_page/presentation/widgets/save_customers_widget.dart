
import 'package:flutter/material.dart';

import '../../model/customer.dart';

class SavedCustomersWidget extends StatelessWidget {
  final List<Customer> customers;

  SavedCustomersWidget(this.customers);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
        return ListTile(
          title: Text(customer.name ?? ''),
          subtitle: Text(customer.email ?? ''),
        );
      },
    );
  }
}

