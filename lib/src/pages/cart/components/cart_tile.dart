import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/utils/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final UtilsServices utilsServices;
  final Function(CartItemModel) remove;
  final Function() updateTotalPrice;

  const CartTile({
    super.key,
    required this.cartItem,
    required this.utilsServices,
    required this.remove,
    required this.updateTotalPrice,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        // Imagem
        // A esquerda
        leading: Image.asset(widget.cartItem.item.image, height: 60, width: 60),

        // Titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),

        // Total
        subtitle: Text(
          widget.utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Quantidade
        // A direita
        trailing: QuantityWidget(
          value: widget.cartItem.quantity,
          unitMeasureText: widget.cartItem.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              widget.updateTotalPrice();
              if (quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
