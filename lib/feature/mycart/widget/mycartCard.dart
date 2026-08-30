import 'package:flutter/material.dart';

class Mycartcard extends StatefulWidget {
  const Mycartcard({super.key});

  @override
  State<Mycartcard> createState() => _MycartcardState();
}

class _MycartcardState extends State<Mycartcard> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),

      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
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
                "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=800&q=80",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brand",
                style: TextStyle(fontWeight: FontWeight(300), fontSize: 14),
              ),

              Text(
                "name",
                style: TextStyle(fontWeight: FontWeight(800), fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                " Size: M · Color: Black",
                style: TextStyle(fontWeight: FontWeight(300), fontSize: 14),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "1998\$",
                    style: TextStyle(fontWeight: FontWeight(800), fontSize: 18),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 0),
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFF7F7F7),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight(800),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight(800),
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 0) {
                                quantity--;
                              }
                            });
                          },
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight(800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
