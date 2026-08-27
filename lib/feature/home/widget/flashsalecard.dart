import 'package:flutter/material.dart';

class Flashsalecard extends StatefulWidget {
  const Flashsalecard({super.key});

  @override
  State<Flashsalecard> createState() => _FlashsalecardState();
}

class _FlashsalecardState extends State<Flashsalecard> {
  bool isFavorite = false;
  int numberstar = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},

            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.asset(
                              "images/shose.avif",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 30,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                          ),
                        ),
                      ),

                      Positioned(
                        left: 20,
                        top: 10,
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          child: const Text(
                            "SALE",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 20,
                        top: 40,
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          child: const Text(
                            "-30%",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(15),
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NIKE",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "AirMax Pro Runners",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                index < numberstar
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ),

                            const Spacer(),

                            Text(
                              "$numberstar.7",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "\$129.99",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
