import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectshop/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "My Cart",
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 36,
                        ),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text("\$" + value.cartItems[index][1]),
                        trailing: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () =>
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemFromCart(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //Totel  + price
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Totel price",
                          style: TextStyle(color: Colors.green[100]),
                        ),
                        Text(
                          "\$" + value.calculateTotal(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(12)),
                      padding:const EdgeInsets.all(12),
                      child: const Row(
                        children: [
                          Text(
                            "Pay now",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
