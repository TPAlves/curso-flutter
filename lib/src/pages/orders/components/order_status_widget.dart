import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/order_model.dart';

class OrderStatusWidget extends StatelessWidget {
  final OrderStatus status;
  final bool isOverdue;

  static Map<OrderStatus, int> allStatus = <OrderStatus, int>{
    OrderStatus.pending: 0,
    OrderStatus.refunded: 1,
    OrderStatus.paid: 2,
    OrderStatus.preparing: 3,
    OrderStatus.shipped: 4,
    OrderStatus.completed: 5,
    OrderStatus.overdue: 6,
  };

  int get currentStatus => allStatus[status]!;

  const OrderStatusWidget({
    super.key,
    required this.status,
    required this.isOverdue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(isActive: true, title: OrderStatus.confirmed.name),
        _CustomDivider(),

        if (currentStatus == 1) ...[
          _StatusDot(
            isActive: true,
            title: OrderStatus.refunded.name,
            backgroundColor: Colors.orangeAccent,
          ),
          _CustomDivider(),
        ] else if (isOverdue) ...[
          _StatusDot(
            isActive: true,
            title: OrderStatus.overdue.name,
            backgroundColor: Colors.redAccent,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: OrderStatus.paid.name,
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: OrderStatus.preparing.name,
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 4,
            title: OrderStatus.shipped.name,
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus == 5,
            title: OrderStatus.completed.name,
          ),
        ],
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    required this.isActive,
    required this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: backgroundColor ?? CustomColors.customSwatchColor,
            ),
            color:
                isActive
                    ? backgroundColor ?? CustomColors.customSwatchColor
                    : Colors.transparent,
          ),
          child:
              isActive
                  ? const Icon(Icons.check, size: 13, color: Colors.white)
                  : const SizedBox.shrink(),
        ),

        const SizedBox(width: 5),

        // Texto
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
