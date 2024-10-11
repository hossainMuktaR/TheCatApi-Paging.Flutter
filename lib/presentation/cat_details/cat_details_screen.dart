import 'package:flutter/material.dart';
import 'package:thecatapi_flutter/domain/entities/cat.dart';

class CatDetailScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final catBreed = cat.breeds!.isNotEmpty ? cat.breeds!.first : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(catBreed?.name ?? "Cat Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.network(
              cat.url,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (catBreed != null) ...[
                    // Name
                    DetailRow(label: 'Name:', value: catBreed.name),
                    const Divider(height: 16.0),

                    // Origin
                    DetailRow(label: 'Origin:', value: catBreed.origin),
                    const Divider(height: 16.0),

                    // Temperament
                    DetailRow(label: 'Temperament:', value: catBreed.temperament),
                    const Divider(height: 16.0),

                    // Description
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      catBreed.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
  });

 @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,  // Prevent overflow and add ellipsis
            maxLines: 2,  // You can limit to any number of lines as needed
          ),
        ),
      ],
    );
  }
}