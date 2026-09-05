import 'package:e_commerce/feature/mycart/cartstore/addtocatlocal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mycartcard extends StatelessWidget {
  const Mycartcard({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Addtocatlocal>(context);

    if (cart.myCart.isEmpty) {
      return const Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: cart.myCart.length,
      itemBuilder: (context, index) {
        final item = cart.myCart[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // ================= IMAGE =================
              Container(
                width: 100,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported, size: 40);
                    },
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // ================= INFO =================
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Size: ${item.selectedSize ?? 'N/A'}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          "\$${item.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                          ),
                        ),

                        const Spacer(),

                        // ================= QUANTITY =================
                        Container(
                          height: 38,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:Text(item.quantity.toString()) ,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ================= DELETE =================
              Container(
                margin: EdgeInsets.only(left: 30),
                child: IconButton(
                  onPressed: () {
                    cart.deleteFromCart(index);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
