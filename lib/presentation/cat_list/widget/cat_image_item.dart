import 'package:flutter/material.dart';
import 'package:thecatapi_flutter/domain/entities/cat.dart';

class CatImageItem extends StatelessWidget {
  final Cat cat;
  final Function(Cat) onCatClick;

  const CatImageItem({
    super.key,
    required this.cat,
    required this.onCatClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCatClick(cat),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Image
            ClipOval(
              child: Image.network(
                cat.url,
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.grey,
                    child: const Icon(Icons.refresh),
                  );
                },
              ),
            ),
            const SizedBox(width: 8.0),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (cat.breeds!.isNotEmpty)
                      Text(
                        cat.breeds!.first.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    const SizedBox(height: 4.0),
                    if (cat.breeds!.isNotEmpty)
                      Text(
                        cat.breeds!.first.origin,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}