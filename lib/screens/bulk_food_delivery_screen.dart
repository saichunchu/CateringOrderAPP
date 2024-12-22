import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'item_selection_screen.dart';
import 'package:celebassign/animations/animation.dart';

class WeddingScreen extends StatefulWidget {
  const WeddingScreen({Key? key}) : super(key: key);

  @override
  State<WeddingScreen> createState() => _WeddingScreenState();
}

class _WeddingScreenState extends State<WeddingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Wedding',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Stack(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://static.vecteezy.com/system/resources/thumbnails/050/494/463/small/indian-weddinggraphy-in-bangalore-free-photo.jpg'), // Replace with your banner URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          // Tabs for Switching
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTab("Bulk Food Delivery", _tabController.index == 0),
                _buildTab("Catering Service", _tabController.index == 1),
              ],
            ),
          ),

          // Tab Bar
          TabBar(
            controller: _tabController,
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.purple,
            isScrollable: true,
            tabs: const [
              Tab(text: "ALL (${3})"),
              Tab(text: "Breakfast"),
              Tab(text: "Lunch & Dinner"),
              Tab(text: "Snacks"),
            ],
          ),

          // Tab Bar View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent(context),
                _buildTabContent(context),
                _buildTabContent(context),
                _buildTabContent(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isActive) {
    return GestureDetector(
      onTap: () {
        // Switch tabs programmatically when clicking "Bulk Food Delivery" or "Catering Service"
        setState(() {
          _tabController.index = isActive ? 0 : 1;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.purple : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildFoodCard(context);
      },
    );
  }

  Widget _buildFoodCard(BuildContext context) {
    return Hero(
      tag: 'food-card-hero',
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(child: const ItemSelectionScreen()),
                );
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12.0)),
                    child: Image.network(
                      'https://i0.wp.com/www.rajbhog.com/wp-content/uploads/2021/06/Homestyle-homemade-food-Indian-comfort-food.jpg', // Replace with your item image URL
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'Best for Pooja🔥',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(90, 201, 200, 200),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        '🤵🏻Min 10 - Max 120',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Indian Soiree',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(height: 8.0),
                  const Row(
                    children: [
                      Icon(Icons.restaurant_menu, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        '7 Categories & 12 Items',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: List.generate(7, (index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgG7sajN1VchV-sSCmdsLYBXB9ayjve_KG3Q&s'),
                        ),
                      );
                    }),
                  ),
                  const Divider(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '₹299/guest',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Add guest count to see ✨ Dynamic Price',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: const ItemSelectionScreen()));
                          },
                          child: const Text(
                            'Customize ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
