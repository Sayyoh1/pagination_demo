import 'package:flutter/material.dart';
import 'package:pagenation_demo/get_requests.dart';
import 'package:pagenation_demo/pagenation_scroll_controller.dart';
import 'package:pagenation_demo/resources/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const RickyAndMortyApp());
}

class RickyAndMortyApp extends StatelessWidget {
  const RickyAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetRequest()..getNewRequests(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Pagination(),
      ),
    );
  }
}

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  PaginationScrollController paginationScrollController =
      PaginationScrollController();

  @override
  void initState() {
    paginationScrollController.init(
        loadAction: () => context.read<GetRequest>().getNewRequests());
    super.initState();
  }

  @override
  void dispose() {
    paginationScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetRequest>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Pagination demo",
                style: TextStyle(color: Colors.white)),
            toolbarHeight: 50,
            elevation: 3,
            shadowColor: AppColors.secondaryColor,
            backgroundColor: AppColors.mainColor,
          ),
          body: Container(
            color: AppColors.secondaryColor,
            child: GridView.count(
              mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 3,
                controller: paginationScrollController.scrollController,
                children: provider.character
                    .map((item) => GridItem(
                          imageUrl: item.image!,
                          name: item.name!,
                        ))
                    .toList()),
          ));
    });
  }
}

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.itemContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              widget.imageUrl,
              width: 70,
              height: 70,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 100,
            height: 40,
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              child: Text(widget.name),
            ),
          )
        ],
      ),
    );
  }
}
