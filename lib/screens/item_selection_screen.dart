import 'package:flutter/material.dart';
import 'fill_details_screen.dart';
import 'package:celebassign/models/menuItems.dart';
import 'package:celebassign/animations/animation.dart';

class ItemSelectionScreen extends StatefulWidget {
  const ItemSelectionScreen({super.key});

  @override
  _ItemSelectionScreenState createState() => _ItemSelectionScreenState();
}

class _ItemSelectionScreenState extends State<ItemSelectionScreen> {
  String selectedCategory = 'Starters';
  bool isVegOnly = true; // Filter for Pure Veg / Non Veg

  // Function to toggle the "isAdded" state
  void toggleItemAdded(int index) {
    setState(() {
      menuItems[index].isAdded = !menuItems[index].isAdded;
    });
  }

  // Function to toggle the "isVegOnly" filter
  void toggleFilter(bool isVeg) {
    setState(() {
      isVegOnly = isVeg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'food-card-hero',
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Indian Soiree'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Filter chips section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterChip(
                    label: Row(
                      children: [
                        Icon(Icons.eco, size: 16, color: Colors.green[700]),
                        const SizedBox(width: 4),
                        Text(
                          'Pure Veg',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.green[50],
                    selected: isVegOnly,
                    onSelected: (bool selected) {
                      toggleFilter(true);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.green[700]!),
                    ),
                  ),
                  const SizedBox(width: 16),
                  FilterChip(
                    label: Row(
                      children: [
                        Icon(Icons.restaurant_menu,
                            size: 16, color: Colors.red[700]),
                        const SizedBox(width: 4),
                        Text(
                          'Non Veg',
                          style: TextStyle(color: Colors.red[700]),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
                    selected: !isVegOnly,
                    onSelected: (bool selected) {
                      toggleFilter(false);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.red[700]!),
                    ),
                  ),
                ],
              ),
            ),

            // Main content with MenuScreen
            Expanded(
              child: Row(
                children: [
                  // Left sidebar with category selection
                  SizedBox(
                    width: 80,
                    child: ListView(
                      children: [
                        _CategoryItem(
                          title: 'Starters',
                          image:
                              'https://thumbs.dreamstime.com/z/lamb-dish-shank-mashed-potatoes-vegetables-53278665.jpg?ct=jpeg',
                          count:
                              '${_filteredMenuItems('Starters').length}/${menuItems.where((item) => item.category == 'Starters').length}',
                          isSelected: selectedCategory == 'Starters',
                          onTap: () {
                            setState(() {
                              selectedCategory = 'Starters';
                            });
                          },
                        ),
                        _CategoryItem(
                          title: 'Mains',
                          image:
                              'https://hogr.app/blog/wp-content/uploads/2022/10/GoatBiryani-scaled-1.webp',
                          count:
                              '${_filteredMenuItems('Mains').length}/${menuItems.where((item) => item.category == 'Mains').length}',
                          isSelected: selectedCategory == 'Mains',
                          onTap: () {
                            setState(() {
                              selectedCategory = 'Mains';
                            });
                          },
                        ),
                        _CategoryItem(
                          title: 'Sweets',
                          image:
                              'https://thumbs.dreamstime.com/z/molecular-gastronomy-dessert-cinnamon-orange-59652666.jpg?ct=jpeg',
                          count:
                              '${_filteredMenuItems('Sweets').length}/${menuItems.where((item) => item.category == 'Sweets').length}',
                          isSelected: selectedCategory == 'Sweets',
                          onTap: () {
                            setState(() {
                              selectedCategory = 'Sweets';
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  // Divider
                  const VerticalDivider(width: 12, thickness: 1),

                  // Main content area with menu items
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _filteredMenuItems(selectedCategory).length,
                      itemBuilder: (context, index) {
                        final item =
                            _filteredMenuItems(selectedCategory)[index];
                        return _MenuItem(
                          name: item.name,
                          imageUrl: item.imageUrl,
                          isAdded: item.isAdded,
                          onAddTap: () => toggleItemAdded(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Bottom section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Price per plate',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '₹240/Plate',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CustomPageRoute(child: const FillDetailsScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Fill Details',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<MenuItem> _filteredMenuItems(String category) {
    // Filter items based on the category and the "Pure Veg" or "Non Veg" filter
    return menuItems.where((item) {
      bool isInCategory = item.category == category;
      bool isVegFilterMatch = isVegOnly ? item.isVeg : !item.isVeg;
      return isInCategory && isVegFilterMatch;
    }).toList();
  }
}

class _CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final String count;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.title,
    required this.image,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: isSelected ? Colors.green : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image),
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              count,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isAdded;
  final VoidCallback onAddTap;

  const _MenuItem({
    required this.name,
    required this.imageUrl,
    required this.isAdded,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(1),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name),
                IconButton(
                  icon: Icon(
                    isAdded ? Icons.check : Icons.add,
                    color: isAdded ? Colors.green : Colors.blue,
                  ),
                  onPressed: onAddTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
