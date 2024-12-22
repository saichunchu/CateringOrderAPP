// Sample Menu Items
class MenuItem {
  final String name;
  final String imageUrl;
  final String category;
  final bool isVeg;
  bool isAdded;

  MenuItem({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.isVeg,
    this.isAdded = false,
  });
}

// Sample data

final List<MenuItem> menuItems = [
  // Starters
  MenuItem(
    name: 'Idli\nSambar',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtoe8O1GrJf0Wsbf1vhQkBLGgCvwWEVD-MLg&s',
    category: 'Starters',
    isVeg: true,
  ),
  MenuItem(
    name: 'Appam',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH4MBTIxHaKJ_fdhSZVZGQ1h8q9vJwA6mYJg&s',
    category: 'Starters',
    isVeg: true,
  ),
  MenuItem(
    name: 'Samosa',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeYXBG4c4BsyyssXKix3ctaQy1JLC9DjYAiw&s',
    category: 'Starters',
    isVeg: true,
  ),
  MenuItem(
    name: 'Vada',
    imageUrl: 'https://static.toiimg.com/photo/97008744.cms',
    category: 'Starters',
    isVeg: true,
  ),
  MenuItem(
    name: 'Dosa',
    imageUrl:
        'https://www.indianhealthyrecipes.com/wp-content/uploads/2020/07/dosa-recipe.jpg',
    category: 'Mains',
    isVeg: true,
  ),
  MenuItem(
    name: 'Wada',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgsx2p71mzFVYk3aMtr6amUG5eIAEnhipskw&s',
    category: 'Mains',
    isVeg: true,
  ),
  MenuItem(
    name: 'Pongal',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQonLqWxFc3-G-HKlsDDhNcvXvIn_XkxYbJ_A&s',
    category: 'Mains',
    isVeg: true,
  ),
  MenuItem(
    name: 'Chole\n Bhature',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSHuqEQvNy--dkfLm4j4WW74dgvb2tb4HilQ&s',
    category: 'Mains',
    isVeg: true,
  ),
  MenuItem(
    name: 'Paneer\nButter\n Masala',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMo1SjO6Pc4r--XqFJ8KzVPYnjInEeQhLhkA&s',
    category: 'Mains',
    isVeg: true,
  ),
  MenuItem(
    name: 'Gulab\nJamun',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThJCVp8hA7z5pchhpx8DllskCiZjrWswIBtw&s',
    category: 'Sweets',
    isVeg: true,
  ),
  MenuItem(
    name: 'Jalebi',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKmkGpUoaX5mJRbkpX5VeOs06YiBHUNsA2BA&s',
    category: 'Sweets',
    isVeg: true,
  ),
  MenuItem(
    name: 'Rasgulla',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDhoZ5eOKa7kv5KQJ7Bvshl136Gv5-sJcsrg&s',
    category: 'Sweets',
    isVeg: true,
  ),
  MenuItem(
    name: 'Kheer',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDhoZ5eOKa7kv5KQJ7Bvshl136Gv5-sJcsrg&s',
    category: 'Sweets',
    isVeg: true,
  ),
  MenuItem(
    name: 'Laddu',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9lkXB1yVduBuzZpoly8_CgQ29nhJKMc5cTQ&s',
    category: 'Sweets',
    isVeg: true,
  ),
  MenuItem(
    name: 'Barfi',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzTuQLEjoTDQyLQKcvaZWIORdJo89rtn3yMA&s',
    category: 'Sweets',
    isVeg: true,
  ),
  MenuItem(
    name: 'Rava\nKesari',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0kuBQ9KtR_sRbRyPpa_bHiEzSqUvUhycD1w&s',
    category: 'Sweets',
    isVeg: true,
  ),
  // Non-Veg Mains
  MenuItem(
    name: 'Butter\n Chicken',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQfysu3jzv-y7psPTFkWdSQpZPFyr0qjd3jw&s',
    category: 'Mains',
    isVeg: false,
  ),
  MenuItem(
    name: 'Biryani',
    imageUrl: 'https://sitarafoods.com/wp-content/uploads/2022/07/02-4-1.jpg',
    category: 'Mains',
    isVeg: false,
  ),
];
