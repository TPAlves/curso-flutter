import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/utils/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.item,
    required this.utilsServices,
  });

  final ItemModel item;
  final UtilsServices utilsServices;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantityValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // Conteúdo principal
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.image,
                  child: Image.asset(widget.item.image),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nome e Quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // Quantidade
                          QuantityWidget(
                            value: quantityValue,
                            unitMeasureText: widget.item.unit,
                            result: (quantity) {
                              setState(() {
                                quantityValue = quantity;
                              });
                              print(quantity);
                            },
                          ),
                        ],
                      ),

                      // Preço
                      Text(
                        widget.utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),

                      // Descrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),

                      // Botão
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          label: const Text(
                            'Adicionar no carrinho',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Voltando para a tela incial
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
