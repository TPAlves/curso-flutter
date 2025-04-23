import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/pages/orders/components/order_tile.dart';
import 'package:greengrocer/src/pages/utils/custom_app_bar.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class OrdersTab extends StatelessWidget {
  final UtilsServices utilsServices;
  const OrdersTab({super.key, required this.utilsServices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pedidos'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return OrderTile(order: app_data.orders[index], utilsServices: utilsServices);
        },
        separatorBuilder: (_, _) => SizedBox(height: 10),
        itemCount: app_data.orders.length,
      ),
    );
  }
}
