import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/components/cart_tile.dart';
import 'package:greengrocer/src/pages/utils/custom_app_bar.dart';
import 'package:greengrocer/src/pages/utils/payment_dialog.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTab extends StatefulWidget {
  final UtilsServices utilsServices;

  const CartTab({super.key, required this.utilsServices});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
      widget.utilsServices.showToast(
        message: '${cartItem.item.itemName} removido(a)',
        isError: false,
      );
    });
  }

  double updateTotalPrice() {
    double totalCart = 0;
    setState(() {
      for (var e in appData.cartItems) {
        (totalCart += e.totalPrice());
      }
    });
    return totalCart;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool?> showOrderConfirmation() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text('Confirmação do pedido'),
            content: const Text('Deseja finalizar o pedido?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Sim', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Não'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: CustomAppBar(title: "Carrinho"),
      body: Column(
        children: [
          // Lista de itens do carrinho
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (_, index) {
                return CartTile(
                  cartItem: appData.cartItems[index],
                  utilsServices: widget.utilsServices,
                  remove: removeItemFromCart,
                  updateTotalPrice: updateTotalPrice,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Total Geral', style: TextStyle(fontSize: 12)),
                Text(
                  widget.utilsServices.priceToCurrency(updateTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if (!context.mounted) return;

                      // ?? false -> se o resultado for nulo, retorna false
                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              orderModel: appData.orders.first,
                              utilsServices: widget.utilsServices,
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Concluir pedido',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
