import 'package:celebassign/models/orderDetails.dart';
import 'package:celebassign/screens/order_review_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:celebassign/animations/animation.dart';
import 'package:flutter/widgets.dart';

class FillDetailsScreen extends StatefulWidget {
  const FillDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FillDetailsScreen> createState() => _FillDetailsScreenState();
}

class _FillDetailsScreenState extends State<FillDetailsScreen>
    with SingleTickerProviderStateMixin {
  String selectedOccasion = 'Birthday'; // Default occasion
  DateTime? selectedDate;
  String? selectedSlot;
  double pricePerPlate = 240.0;
  int totalGuests = 120;
  late AnimationController _countController;
  // late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _countController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Create a scale animation
    void _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _countController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _countController.dispose();
    super.dispose();
  }
  // Default guest count

  final List<String> occasions = [
    'Birthday',
    'Wedding',
    'Corporate Event',
    'Anniversary',
    'Other',
  ];

  final List<String> timeSlots = [
    '9:00 AM - 11:00 AM',
    '11:00 AM - 1:00 PM',
    '1:00 PM - 3:00 PM',
    '3:00 PM - 5:00 PM',
    '5:00 PM - 7:00 PM',
    '7:00 PM - 9:00 PM',
  ];

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'Select Date';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Fill Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Row(
                children: [
                  const Icon(Icons.breakfast_dining, color: Colors.purple),
                  const SizedBox(width: 8),
                  const Text(
                    ' Indian Soiree',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Handle edit
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.edit, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Occasion Dropdown
              DropdownButtonFormField<String>(
                value: selectedOccasion,
                items: occasions
                    .map((occasion) => DropdownMenuItem(
                          value: occasion,
                          child: Text(occasion),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedOccasion = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Occasion',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Date Picker
              GestureDetector(
                onTap: _selectDate,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        selectedDate != null
                            ? formatDate(selectedDate)
                            : 'Select Date',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: _selectDate,
                          icon: Icon(Icons.date_range_rounded))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Time Slot Dropdown
              DropdownButtonFormField<String>(
                value: selectedSlot,
                items: timeSlots
                    .map((slot) => DropdownMenuItem(
                          value: slot,
                          child: Text(slot),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSlot = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Time Slot',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Price per Plate
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price Per Plate:',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '20% ↓',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '₹299',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '₹240',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Total Guests
              AnimatedBuilder(
                animation: _countController,
                builder: (context, child) {
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (totalGuests > 10) {
                              totalGuests--;
                              _countController.reverse();
                            }
                          });
                        },
                        icon: const Icon(Icons.remove_circle_outline,
                            color: Colors.purple),
                      ),
                      Expanded(
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 300),
                          tween: IntTween(
                              begin: totalGuests - 1, end: totalGuests),
                          builder: (context, value, child) {
                            return Container(
                              height: 56,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '$value',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (totalGuests < 1500) {
                              totalGuests++;
                              _countController.forward();
                            }
                          });
                        },
                        icon: const Icon(Icons.add_circle_outline,
                            color: Colors.purple),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 16),

              // Dynamic Pricing Slider
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Slider(
                    value: totalGuests.toDouble(),
                    min: 10,
                    max: 1500,
                    divisions: 149,
                    onChanged: (value) {
                      setState(() {
                        totalGuests = value.toInt();
                      });
                    },
                  ),
                  const Text(
                    '✨ DYNAMIC PRICING: more guests, more savings.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Order Review Button
              ElevatedButton(
                onPressed: () {
                  final orderDetails = OrderDetails(
                      Occassion: selectedOccasion,
                      totalGuests: totalGuests,
                      date: selectedDate!,
                      timeSlot: selectedSlot!,
                      pricePerPlate: pricePerPlate);
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child:
                              OrderReviewScreen(orderDetails: orderDetails)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Order Review',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
