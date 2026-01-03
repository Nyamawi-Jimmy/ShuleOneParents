import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../StudentControllers/ResourcesAllBooksController.dart';
import '../StudentControllers/ResourcesGenresControllers.dart';

class Studentebooklibrarypage extends StatefulWidget {
  const Studentebooklibrarypage({super.key});

  @override
  State<Studentebooklibrarypage> createState() => _StudentebooklibrarypageState();
}

class _StudentebooklibrarypageState extends State<Studentebooklibrarypage> {
  List<String> genres = ["All"];
  String selectedGenre = "All";
  @override
  void initState() {
    _studentelibrarygenres();
    _studentelibraryallbooks();
    super.initState();
  }

  void _studentelibrarygenres() async {
    final controller = Get.find<Resourcesgenrescontrollers>();
    final response = await controller.getstudentcoding();

    if (response.isSuccess) {
      final List data = response.message; // decode the JSON
      setState(() {
        // Add the genre names from the response to your list
        genres = [
          "All", // keep default
          ...data.map((e) => e['name'].toString()) // extract names
        ];
      });

      // debug print
      print("Genres loaded: $genres");
    } else {
      setState(() {
        genres = ["All"]; // fallback if request fails
      });
    }
  }
  List<Map<String, String>> books = []; // start empty

  void _studentelibraryallbooks() async {
    final controller = Get.find<Resourcesallbookscontroller>();
    final response = await controller.getresourcesallbooks();

    if (response.isSuccess) {
      final List data =response.message; // decode JSON
      print("Books loaded: $data");

      setState(() {
        books = data.map<Map<String, String>>((e) {
          String genre = "";
          if (e['genres'] != null && e['genres'].isNotEmpty) {
            genre = e['genres'][0]['name'] ?? "";
          }

          return {
            "title": e['title'] ?? "",
            "author": e['author'] ?? "",
            "genre": genre,
            "image": e['cover'] ?? "assets/images/shuleone.png", // fallback
          };
        }).toList();

      });
    } else {
      setState(() {
        books = []; // fallback empty list
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (books.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Filtered books by genre
    final filteredBooks = selectedGenre == "All"
        ? books
        : books.where((b) => b["genre"] == selectedGenre).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ================= HEADER TEXT =================
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore eBooks",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Read, learn and grow with our curated library",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.disabledColor,
                ),
              ),
            ],
          ),
        ),

        /// ================= GENRE FILTER =================
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final genre = genres[index];
              final selected = genre == selectedGenre;

              return FilterChip(
                label: Text(genre),
                selected: selected,
                showCheckmark: false,
                backgroundColor: Colors.grey.shade200,
                selectedColor: theme.primaryColor,
                labelStyle: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
                onSelected: (_) {
                  setState(() {
                    selectedGenre = genre;
                  });
                },
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        /// ================= BOOK GRID =================
        Expanded(
          child: filteredBooks.isEmpty
              ? Center(
            child: Text(
              "No books available for '$selectedGenre'",
              style: theme.textTheme.bodyMedium,
            ),
          )
              : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filteredBooks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.55,
            ),
            itemBuilder: (context, index) {
              final book = filteredBooks[index];

              return Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// BOOK IMAGE
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: book["image"]!.isNotEmpty
                          ? Image.network(
                        book["image"]!,
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Image.asset("assets/images/shuleone.png",
                                height: 170,
                                width: double.infinity,
                                fit: BoxFit.cover),
                      )
                          : Image.asset(
                        "assets/images/shuleone.png",
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book["title"]!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            book["author"]!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.disabledColor,
                            ),
                          ),
                          const SizedBox(height: 10),

                          /// GENRE BADGE
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color:
                                theme.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                book["genre"]!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
