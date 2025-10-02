import 'package:flutter/material.dart';
import 'dummy_menu.dart';
import 'homescreen.dart';

class MenuDetailScreen extends StatefulWidget {
  final FoodMenu daftar;
  final bool isBookmarked;
  final bool isFavorited;

  const MenuDetailScreen({
    super.key,
    required this.daftar,
    this.isBookmarked = false,
    this.isFavorited = false,
  });

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  late bool bookmarked;
  late bool favorited;

  @override
  void initState() {
    super.initState();
    bookmarked = widget.isBookmarked;
    favorited = widget.isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2C),
        elevation: 0,
        title: Text(
          widget.daftar.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.daftar.imageUrls[0],
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error, color: Colors.grey),
                  );
                },
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              widget.daftar.category,
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.daftar.cookingTime,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 8),

            Text(
              widget.daftar.price,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Description:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.daftar.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Ingredients:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.daftar.ingredients,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(username: "User"),
                    ),
                    (route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berhasil membeli ${widget.daftar.name}"),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 191, 0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
