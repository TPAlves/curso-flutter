import 'package:greengrocer/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  OrderStatus status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}

enum OrderStatus {
  pending,
  completed,
  canceled;

  String get name {
    switch (this) {
      case OrderStatus.pending:
        return 'Pendente';
      case OrderStatus.completed:
        return 'Concluído';
      case OrderStatus.canceled:
        return 'Cancelado';
    }
  }
}
