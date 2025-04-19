import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

List<String> categories = [
  'Frutas',
  'Verduras',
  'Legumes',
  'Cereais',
  'Carnes',
  'Laticínios',
];

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  image: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  image: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  image: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  image: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  image: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  image: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

List<ItemModel> items = [apple, grape, guava, kiwi, mango, papaya];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: mango, quantity: 5),
  CartItemModel(item: papaya, quantity: 1),
];

UserModel userModel = UserModel(
  name: "Neymar Jr",
  email: "ney@neymar.com",
  phone: "11999999999",
  cpf: "123.456.789-00",
  password: "12345678",
);

double cartTotal = cartItems
    .map((item) {
      return item.totalPrice();
    })
    .reduce((value, element) => value + element);

List<OrderModel> orders = [
  OrderModel(
    id: 'asdasd6a54da6s2d1',
    createdDateTime: DateTime.now(),
    overdueDateTime: DateTime.now().add(const Duration(days: 3)),
    items: cartItems,
    status: OrderStatus.pending,
    copyAndPaste: '123456789',
    total: cartTotal,
  ),
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse('2022-06-08 10:00:10.458'),
    overdueDateTime: DateTime.parse('2022-06-08 11:00:10.458'),
    id: 'asd6a54da6s2d1',
    status: OrderStatus.pending,
    total: 11.0,
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: mango, quantity: 2),
    ],
  ),
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse('2022-06-08 10:00:10.458'),
    overdueDateTime: DateTime.parse('2022-06-08 11:00:10.458'),
    id: 'a65s4d6a2s1d6a5s',
    status: OrderStatus.completed,
    total: 11.5,
    items: [CartItemModel(item: guava, quantity: 1)],
  ),
];
