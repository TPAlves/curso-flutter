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
  confirmed,
  pending,
  refunded,
  paid,
  preparing,
  shipped,
  overdue,
  completed;

  String get name {
    switch (this) {
      case OrderStatus.confirmed:
        return 'Confirmado';
      case OrderStatus.pending:
        return 'Pendente';
      case OrderStatus.refunded:
        return 'Reembolsado';
      case OrderStatus.paid:
        return 'Pago';
      case OrderStatus.preparing:
        return 'Preparando';
      case OrderStatus.shipped:
        return 'Enviado';
      case OrderStatus.completed:
        return 'Concluído';
      case OrderStatus.overdue:
        return 'Pagamento Vencido';
    }
  }
}
