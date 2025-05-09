import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/orders/components/order_status_widget.dart';
import 'package:greengrocer/src/pages/utils/payment_dialog.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  final UtilsServices utilsServices;
  const OrderTile({
    super.key,
    required this.order,
    required this.utilsServices,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == OrderStatus.pending,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido: #${order.id} ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // Lista de produtos
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children:
                            order.items.map((orderItem) {
                              return _OrderItemWidget(
                                utilsServices: utilsServices,
                                orderItem: orderItem,
                              );
                            }).toList(),
                      ),
                    ),
                  ),

                  // Divisão
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: VerticalDivider(
                      color: Colors.grey.shade300,
                      thickness: 2,
                      width: 8,
                    ),
                  ),

                  // Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue:
                          order.overdueDateTime.isBefore(DateTime.now()) &&
                          order.status != OrderStatus.completed,
                    ),
                  ),
                ],
              ),
            ),

            // Total do pedido
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 20),
                children: [
                  const TextSpan(
                    text: "Total: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: utilsServices.priceToCurrency(order.total)),
                ],
              ),
            ),

            // Botão de pagamento
            Visibility(
              visible: order.status == OrderStatus.pending,
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(
                        orderModel: order,
                        utilsServices: utilsServices,
                      );
                    },
                  );
                },
                label: const Text(
                  "Visualizar QR Code",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.pix, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    required this.utilsServices,
    required this.orderItem,
  });

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Text(
              '${orderItem.quantity} ${orderItem.item.unit}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice())),
        ],
      ),
    );
  }
}
