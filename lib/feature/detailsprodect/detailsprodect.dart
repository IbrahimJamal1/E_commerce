import 'package:e_commerce/feature/auth/widgets/snackbar.dart';
import 'package:e_commerce/feature/detailsprodect/widget/desprodect.dart';
import 'package:e_commerce/feature/detailsprodect/widget/spaceprodect.dart';
import 'package:e_commerce/feature/home/models/modelproduct.dart';
import 'package:e_commerce/feature/mycart/cartstore/addtocatlocal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detailsprodect extends StatefulWidget {
  final ProductModel detailprod;

  const Detailsprodect({super.key, required this.detailprod});

  @override
  State<Detailsprodect> createState() => _DetailsprodectState();
}

class _DetailsprodectState extends State<Detailsprodect> {
  final List<String> sizes = ["XXS", "XS", "S", "M", "L", "XL", "XXL"];

  late final List<dynamic> page = [
    desprodect(widget.detailprod.description),
    spaceprodect(
      widget.detailprod.material,
      widget.detailprod.weight,
      widget.detailprod.waterproof,
      widget.detailprod.origin,
      widget.detailprod.sku,
    ),
  ];
  int currentPage = 0;
  String? selectedSize;

  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Addtocatlocal>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(widget.detailprod.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    customBorder: const CircleBorder(),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.detailprod.prands,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight(300)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.detailprod.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight(800)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${widget.detailprod.price.toString()}\$",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight(800)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  ...List.generate(
                    widget.detailprod.rating.round(),
                    (index) => Icon(
                      index < widget.detailprod.rating
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.amber,
                      size: 25,
                    ),
                  ),

                  const Spacer(),

                  Text(
                    widget.detailprod.rating.toStringAsFixed(1),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight(300)),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    "(${widget.detailprod.numrating.toStringAsFixed(0)}k)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight(300)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text("Color : ", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(width: 5),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: widget.detailprod.color,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                if (selectedSize != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Size : $selectedSize",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Size : ${widget.detailprod.stock}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                Spacer(),

                TextButton(
                  onPressed: () {},
                  child: Text("Size Guide", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: List.generate(sizes.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedSize = sizes[index];
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: selectedSize == sizes[index]
                                ? Colors.blue
                                : Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              sizes[index],
                              style: TextStyle(
                                color: selectedSize == sizes[index]
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Quantity : $quantity",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 30),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(15),
                color: Color(0xC8EDE5E5),
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
                        fontSize: 25,
                        fontWeight: FontWeight(800),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight(800)),
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
                        fontSize: 25,
                        fontWeight: FontWeight(800),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              width: double.infinity,

              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          currentPage = 0;
                        });
                      },
                      child: const Text("Decoration"),
                    ),
                  ),

                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          currentPage = 1;
                        });
                      },
                      child: const Text("Space"),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            page[currentPage],
          ],
        ),
      ),

      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            
            const SizedBox(width: 10),

            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  cart.addToCart(
                    id: widget.detailprod.id,
                    name: (widget.detailprod.name),
                    price: widget.detailprod.price,
                    quantity: quantity,
                    selectedSize: selectedSize,
                    image: widget.detailprod.image,
                    color: widget.detailprod.color,
                    stock: widget.detailprod.stock,
                  );
                  showMySnackBar(context, "Product added to cart",isError: false);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Add Cart",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
