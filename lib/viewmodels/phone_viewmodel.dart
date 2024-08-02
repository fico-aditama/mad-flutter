import 'package:flutter/material.dart';
import '../models/phone.dart';

class PhoneViewModel extends ChangeNotifier {
  List<Phone> _phones = [];
  List<Phone> _cart = [];

  List<Phone> get phones => _phones;
  List<Phone> get cart => _cart;

  void addPhone(Phone phone) {
    _phones.add(phone);
    notifyListeners();
  }

  void addToCart(Phone phone) {
    _cart.add(phone);
    notifyListeners();
  }

  void removeFromCart(Phone phone) {
    _cart.remove(phone);
    notifyListeners();
  }
}
