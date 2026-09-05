import 'package:e_commerce/feature/orderstate/getdata.dart';
import 'package:flutter/material.dart';

class OrderState extends StatefulWidget {
  const OrderState({super.key});

  @override
  State<OrderState> createState() => _OrderStateState();
}

class _OrderStateState extends State<OrderState> {
  late Future<List<Map<String, dynamic>>> orders;

  @override
  void initState() {
    super.initState();

    orders = OrderData().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: orders,
      builder: (context, snapshot) {
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        // No orders
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Scaffold(
            body: Center(
              child: Text('No orders found', style: TextStyle(fontSize: 20)),
            ),
          );
        }

        // أول Order
        final order = snapshot.data!.first;

        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 60),

              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFB9F6C5),
                        Color(0xFFE8FBEA),
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFF18A84A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Order Placed !",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),

              const SizedBox(height: 30),

              Container(margin: EdgeInsets.all(30),
                child: const Text(
                  "Your order has been confirmed and is being prepared for shipment.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),

              const SizedBox(height: 40),

              Container(
                margin: const EdgeInsets.all(20),
                width: 350,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Order ID",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "#${order['orderId']}",
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    Row(
                      children: [
                        const Text(
                          "Total Paid",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "\$${order['total']}",
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    Row(
                      children: [
                        const Text(
                          "Discount",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "\$${order['discount']}",
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    Row(
                      children: [
                        const Text(
                          "Status",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "${order['status']}",
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "${order['createdAt'].toDate()}",
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          "Counter Items",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "${order['items'].length} items",
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),
                  ],
                ),
              ),
            ],
          ),

          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(
              bottom: 50,
              left: 20,
              right: 20,
              top: 10,
            ),
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Continue Shopping",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
