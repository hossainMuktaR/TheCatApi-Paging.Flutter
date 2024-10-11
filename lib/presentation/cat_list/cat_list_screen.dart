import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecatapi_flutter/domain/entities/cat.dart';
import 'package:thecatapi_flutter/presentation/cat_details/cat_details_screen.dart';
import 'package:thecatapi_flutter/presentation/cat_list/cat_list_viewmodel.dart';
import 'package:thecatapi_flutter/presentation/cat_list/widget/cat_image_item.dart';

class CatListScreen extends StatelessWidget {
  const CatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat List'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CatListViewModel(),
        child: Consumer<CatListViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.errorMessage != null) {
              return Center(child: Text(viewModel.errorMessage!));
            }

            return ListView.builder(
              itemCount: viewModel.cats.length,
              itemBuilder: (context, index) {
                final cat = viewModel.cats[index];
                return CatImageItem(
                    cat: cat,
                    onCatClick: (cat) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CatDetailScreen(cat: cat)));
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
