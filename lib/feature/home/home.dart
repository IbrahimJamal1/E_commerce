import 'package:e_commerce/feature/home/widget/countdowen.dart';
import 'package:e_commerce/feature/home/widget/flashsalecard.dart';
import 'package:e_commerce/feature/home/widget/navitem.dart';
import 'package:e_commerce/feature/home/widget/newarrivals.dart';
import 'package:e_commerce/feature/home/widget/recommended%20.dart';
import 'package:e_commerce/feature/home/widget/rowcategorices.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const Homepage(),
    const Center(child: Text("Expplore")),
    const Center(child: Text("Like")),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: pages[currentIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        backgroundColor: Colors.blue,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,

        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(
                icon: Icons.home_outlined,
                label: "Home",
                index: 0,
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),

              navItem(
                icon: Icons.grid_view_rounded,
                label: "Expplore",
                index: 1,
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),

              navItem(
                icon: Icons.favorite_border,
                label: "Like",
                index: 2,
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),

              navItem(
                icon: Icons.person_outline,
                label: "Profile",
                index: 3,
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search Products,brands....",
                  prefixIcon: Icon(Icons.search_sharp),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0072C6), Color(0xFF00B4D8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Limited offer",
                          style: TextStyle(color: const Color(0xB8413EFB)),
                        ),
                        Text(
                          "Up to 50%  ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight(800),
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          "off this week",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight(800),
                            fontSize: 26,
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Shop Now",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight(400),
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(Icons.arrow_right, size: 26),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("🛍️", style: TextStyle(fontSize: 80)),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight(800), fontSize: 20),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text("See all", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(title: 'Shoes', icon: "👟", isSelected: true),
                  SizedBox(width: 12),
                  CategoryCard(title: 'Tech', icon: " 📱"),
                  SizedBox(width: 12),
                  CategoryCard(title: 'Fashion', icon: "👗"),
                  SizedBox(width: 12),
                  CategoryCard(title: 'Home', icon: "🏠"),
                  SizedBox(width: 12),
                  CategoryCard(title: 'Beauty', icon: "💄"),
                  SizedBox(width: 12),
                  CategoryCard(title: 'Sports', icon: "⚽"),
                  SizedBox(width: 12),
                  CategoryCard(title: 'Books', icon: "📚"),
                  SizedBox(width: 12),
                  CategoryCard(title: 'Toys', icon: "🧸"),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text("⚡", style: TextStyle(fontSize: 20)),
                SizedBox(width: 8),
                Text(
                  "Flash Sale",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight(800)),
                ),
                SizedBox(width: 8),
                FlashSaleTimer(
                  duration: Duration(hours: 5, minutes: 30, seconds: 0),
                ),
              ],
            ),

            Flashsalecard(),

            SizedBox(height: 15),

            Row(
              children: [
                Text(
                  "New Arrivals",
                  style: TextStyle(fontWeight: FontWeight(800), fontSize: 20),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text("See all", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),

            SizedBox(height: 15),

            Newarrivals(),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Recommended for You",
                  style: TextStyle(fontWeight: FontWeight(800), fontSize: 20),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text("See all", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 15),
            Recommend(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
