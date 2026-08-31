import 'package:flutter/material.dart';

class OrderState extends StatefulWidget {
  const OrderState({super.key});

  @override
  State<OrderState> createState() => _OrderStateState();
}

class _OrderStateState extends State<OrderState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Center(
            child: Container(
              width: 120,
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFB9F6C5), // أخضر فاتح
                    Color(0xFFE8FBEA), // أخضر فاتح جدًا
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
                child: const Icon(Icons.check, color: Colors.white, size: 35),
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Order Placed !",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight(900)),
          ),
          SizedBox(height: 30),
          Text(
            "Your order has been confirmed and is being prepared for shipment.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight(300)),
          ),
          SizedBox(height: 40),

          Container(
            margin: EdgeInsets.all(20),
            width: 350,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Order ID",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight(300),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "#ORD-47822",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight(700),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Estimated Delivery",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight(300),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Text(
                        "Aug 27–28, 2026",

                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Total Paid",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight(300),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$509.63",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight(700),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight(300),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Under Review",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight(700),
                      ),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 50, left: 20, right: 20, top: 10),
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
  }
}
