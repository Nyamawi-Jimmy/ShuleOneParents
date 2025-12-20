import 'package:flutter/material.dart';

class EbookLibraryPage extends StatefulWidget {
  const EbookLibraryPage({super.key});

  @override
  State<EbookLibraryPage> createState() => _EbookLibraryPageState();
}

class _EbookLibraryPageState extends State<EbookLibraryPage> {
  String selectedGenre = "All";

  final List<String> genres = [
    "All",
    "Science",
    "Mathematics",
    "Technology",
    "History",
    "Literature",
  ];

  final List<Map<String, String>> books = [
    {
      "title": "Physics Fundamentals",
      "author": "Isaac Newton",
      "genre": "Science",
      "image": "assets/images/shuleone.png",
    },
    {
      "title": "Pure Mathematics",
      "author": "Leonhard Euler",
      "genre": "Mathematics",
      "image": "assets/images/shuleone.png",
    },
    {
      "title": "Flutter in Action",
      "author": "Google Dev Team",
      "genre": "Technology",
      "image": "assets/images/shuleone.png",
    },
    {
      "title": "World History",
      "author": "Howard Zinn",
      "genre": "History",
      "image": "assets/images/shuleone.png",
    },
    {
      "title": "Classic Literature",
      "author": "William Shakespeare",
      "genre": "Literature",
      "image": "assets/images/shuleone.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filteredBooks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.62,
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
                      child: Image.asset(
                        book["image"]!,
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
                                color: theme.primaryColor.withOpacity(0.1),
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
