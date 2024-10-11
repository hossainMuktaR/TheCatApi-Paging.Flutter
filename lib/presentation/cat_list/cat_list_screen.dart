import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecatapi_flutter/presentation/cat_details/cat_details_screen.dart';
import 'package:thecatapi_flutter/presentation/cat_list/cat_list_viewmodel.dart';
import 'package:thecatapi_flutter/presentation/cat_list/widget/cat_image_item.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  _CatListScreenState createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  final ScrollController _scrollController = ScrollController();
  late CatListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CatListViewModel();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      viewModel.loadCats();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat List'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CatListViewModel>(
          builder: (context, viewModel, child) {
            // if (viewModel.isLoading) {
            //   return const Center(child: CircularProgressIndicator());
            // }

            if (viewModel.errorMessage != null) {
              return Center(child: Text(viewModel.errorMessage!));
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: viewModel.cats.length + 1,
              itemBuilder: (context, index) {
                if (index == viewModel.cats.length) {
                  // Show loading indicator at the bottom
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                                  final cat = viewModel.cats[index];

                  return CatImageItem(
                      cat: cat,
                      onCatClick: (cat) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CatDetailScreen(cat: cat)));
                      });
                }
              },
            );
          },
        ),
      ),
    );
  }
}
