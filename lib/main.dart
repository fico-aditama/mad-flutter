import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/phone.dart';
import 'viewmodels/phone_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PhoneViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhoneListScreen(),
    );
  }
}

class PhoneListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneViewModel = Provider.of<PhoneViewModel>(context);

    // Add some sample phones
    if (phoneViewModel.phones.isEmpty) {
      phoneViewModel.addPhone(Phone(name: 'iPhone 13', brand: 'Apple', price: 999.99, imageUrl: 'https://via.placeholder.com/150'));
      phoneViewModel.addPhone(Phone(name: 'Galaxy S21', brand: 'Samsung', price: 799.99, imageUrl: 'https://via.placeholder.com/150'));
      phoneViewModel.addPhone(Phone(name: 'Pixel 6', brand: 'Google', price: 599.99, imageUrl: 'https://via.placeholder.com/150'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: phoneViewModel.phones.length,
        itemBuilder: (context, index) {
          final phone = phoneViewModel.phones[index];
          return ListTile(
            leading: Image.network(phone.imageUrl),
            title: Text(phone.name),
            subtitle: Text('${phone.brand} - \$${phone.price}'),
            trailing: ElevatedButton(
              onPressed: () {
                phoneViewModel.addToCart(phone);
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneViewModel = Provider.of<PhoneViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: phoneViewModel.cart.length,
        itemBuilder: (context, index) {
          final phone = phoneViewModel.cart[index];
          return ListTile(
            leading: Image.network(phone.imageUrl),
            title: Text(phone.name),
            subtitle: Text('${phone.brand} - \$${phone.price}'),
            trailing: ElevatedButton(
              onPressed: () {
                phoneViewModel.removeFromCart(phone);
              },
              child: Text('Remove'),
            ),
          );
        },
      ),
    );
  }
}
