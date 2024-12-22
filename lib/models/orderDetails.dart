class OrderDetails {
  final int totalGuests;
  final String Occassion;
  final DateTime date;
  final String timeSlot;
  final double pricePerPlate;

  OrderDetails({
    required this.Occassion,
    required this.totalGuests,
    required this.date,
    required this.timeSlot,
    required this.pricePerPlate,
  });
}
